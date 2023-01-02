import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/avatar.dart';
import '../home/home_controller.dart';
import 'auth_controller.dart';
import 'signin_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tài khoản'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              homeController.rxConnectionType.value != 0
                  ? Avatar(controller.rxFireStoreUser.value!.photoUrl)
                  : const Avatar(""),
              const SizedBox(width: 5),
              Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text(controller.rxFireStoreUser.value!.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  Text('Email: ${controller.rxFireStoreUser.value!.email}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  dialogSignOut(context);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('Thoát tài khoản'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future dialogSignOut(context) => showDialog(
      context: context,
      builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: Column(
                    children: [
                      const Text("Bạn chắc muốn thoát chứ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          AuthController.to.signOut();
                          Get.offAll(SignInScreen(),
                              transition: Transition.fadeIn);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size(200, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text('Thoát',
                            style: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text('Trở về'),
                      ),
                    ],
                  )),
              Positioned(
                  top: -115,
                  width: 150,
                  height: 150,
                  child: Image.asset("assets/images/sign_out.png"))
            ],
          )));
}
