import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_japanese/app/authentication/loading_data_screen.dart';
import 'package:learn_japanese/models/lesson_model.dart';
import 'package:learn_japanese/models/models.dart';
import 'package:learn_japanese/app/home/home.dart';
import 'dart:convert';
import '../../components/loading.dart';
import '../home/home_controller.dart';
import 'signin_screen.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> rxFireStoreUser = Rxn<UserModel>();
  final obscurePassword = true.obs;
  var googleUser = Rx<GoogleSignInAccount?>(null);
  var facebookUser = {};
  List<LessonStatus> listLessonStatus = List.filled(10, LessonStatus());

  @override
  void onReady() {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.bindStream(user);
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  handleAuthChanged(firebaseUser) {
    //get user data from firestore
    if (firebaseUser?.uid != null) {
      rxFireStoreUser.bindStream(streamFireStoreUser());
      update();
    }
    if (firebaseUser == null) {
      Get.offAll(SignInScreen());
    } else {
      Get.to(const LoadingDataScreen(), transition: Transition.fadeIn);
      Timer(const Duration(milliseconds: 1700), () {
        Get.put(HomeController());
        Get.offAll(const HomeUI(), arguments: 0,transition: Transition.fadeIn);
      });
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFireStoreUser() {
    return _db
        .doc('/users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) => UserModel.fromMap(snapshot.data()));
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFireStoreUser() {
    return _db.doc('/users/${firebaseUser.value!.uid}').get().then(
        (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()!));
  }

  //updates the firestore user in users collection
  void updateUserFireStore() {
    _db
        .doc('/users/${firebaseUser.value!.uid}')
        .update(rxFireStoreUser.toJson());
    update();
    debugPrint("updateUserFireStore Working!");
  }

  //Method to handle user sign in using email and password
  signInWithEmailAndPassword(BuildContext context) async {
    showLoadingIndicator();
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      hideLoadingIndicator();
      // // delete after 3 seconds to avoid showing error of validator
      Timer(const Duration(seconds: 3), () {
        emailController.clear();
        passwordController.clear();
      });
    } catch (error) {
      hideLoadingIndicator();
      Get.snackbar('Đăng nhập không thành công!', 'error.message!',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // User registration using email and password
  registerWithEmailAndPassword(BuildContext context) async {
    showLoadingIndicator();
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((result) async {
        debugPrint('uID: ${result.user!.uid}');
        debugPrint('email: ${result.user!.email}');

        //create the new user object
        UserModel newUser = UserModel(
          uid: result.user!.uid,
          email: result.user!.email!,
          name: nameController.text,
          photoUrl: '',
          listFinishedLesson: [],
          listLessonStatus: listLessonStatus,
          listQuizWord: [],
        );
        //create the user in firestore
        _createUserFireStore(newUser, result.user!);
        // delete after 3 seconds to avoid showing error of validator
        Timer(const Duration(seconds: 3), () {
          emailController.clear();
          passwordController.clear();
        });
        hideLoadingIndicator();
      });
    } on FirebaseAuthException catch (error) {
      hideLoadingIndicator();
      Get.snackbar('Đăng ký không thành công!', error.message!,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //create the firestore user in users collection
  void _createUserFireStore(UserModel user, User firebaseUser) {
    _db.doc('/users/${firebaseUser.uid}').set(user.toJson());
    update();
  }

  // Sign out
  Future<void> signOut() {
    logoutFacebook();
    logoutGoogle();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    rxFireStoreUser.value = null;
    return _auth.signOut();
  }

  void loginWithGoogle() async {
    try {
      googleUser.value = await (GoogleSignIn().signIn());
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.value!.authentication;
      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      //check if document is exists to prevent new create
      _db
          .doc('/users/${firebaseUser.value!.uid}')
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists == false) {
          //create the user in firestore
          UserModel newUser = UserModel(
            uid: googleUser.value?.id ?? '',
            email: googleUser.value?.email ?? '',
            name: googleUser.value?.displayName ?? '',
            photoUrl: googleUser.value?.photoUrl ?? '',
            listFinishedLesson: [],
            listLessonStatus: listLessonStatus,
            listQuizWord: [],
          );
          _createUserFireStore(newUser, user!);
        }
      });
      // hideLoadingIndicator();
    } on FirebaseAuthException catch (e) {
      Get.bottomSheet(
          Column(
            children: [
              const Text(
                'Đăng ký thất bại',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              Text(
                e.message!,
                // e.toString()
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ],
          ),
          exitBottomSheetDuration: const Duration(seconds: 5));
      Get.to(const HomeUI(),arguments: 0, transition: Transition.fadeIn);
    }
  }

  void logoutGoogle() async {
    googleUser.value = await GoogleSignIn().signOut();
  }

  void loginWithFacebook() async {
    try {
      final loginResult = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile']);
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);
      final User? user = userCredential.user;
      // Get the user information
      if (loginResult.status == LoginStatus.success) {
        facebookUser = (await FacebookAuth.instance.getUserData());
      }

      //check if document is exists to prevent new create
      _db
          .doc('/users/${firebaseUser.value!.uid}')
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists == false) {
          //create the FaceBook user in firestore
          UserModel newUser = UserModel(
            uid: jsonDecode(facebookUser["id"]).toString(),
            email: await jsonDecode(jsonEncode(facebookUser["email"])),
            name: jsonDecode(jsonEncode(facebookUser["name"])),
            photoUrl:
                jsonDecode(jsonEncode(facebookUser["picture"]["data"]["url"])),
            listFinishedLesson: [],
            listLessonStatus: listLessonStatus,
            listQuizWord: [],
          );
          _createUserFireStore(newUser, user!);
        }
      });
      hideLoadingIndicator();
    } on FirebaseAuthException catch (e) {
      Get.bottomSheet(Wrap(
        children: [
          const Text(
            "Đăng nhập không thành công!",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          Text(
            e.toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ));
    }
  }

  void logoutFacebook() async {
    await FacebookAuth.instance.logOut();
  }

  Widget visiblePassword() {
    return InkWell(
      child:
          Icon(obscurePassword.value ? Icons.visibility : Icons.visibility_off),
      onTap: () {
        obscurePassword.value = !obscurePassword.value;
      },
    );
  }

  void updateUserData(int indexTopic) {
    final fsUser = rxFireStoreUser.value!;
    fsUser.listFinishedLesson.add(indexTopic);
    fsUser.listLessonStatus[indexTopic].isFinishLesson = true;
    fsUser.listLessonStatus[indexTopic].listWordStatus = List.filled(10, false);
    updateUserFireStore();
  }

  void updateFinishLesson(int indexTopic) {
    final fsUser = rxFireStoreUser.value!;
    fsUser.listFinishedLesson.add(indexTopic);
    fsUser.listLessonStatus[indexTopic].isFinishLesson = true;
    fsUser.listLessonStatus[indexTopic].listWordStatus = List.filled(10, false);
    AuthController.to.updateUserFireStore();
  }

  void updateFinishQuiz() {
    final fsUser = rxFireStoreUser.value!;
    fsUser.listQuizWord=[];
    AuthController.to.updateUserFireStore();
  }

}
