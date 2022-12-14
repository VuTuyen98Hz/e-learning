import 'package:get/get.dart';
import 'package:learn_japanese/app/authentication/auth_controller.dart';

class LearningController extends GetxController {
  static LearningController to = Get.find();
  RxBool rxIsEndRoundOne = RxBool(false);
  RxList<int> rxListWordRoundTwo = RxList();
  RxInt rxProgressBarPoint = RxInt(0);
  List<int> listLearnedLesson = [];
  final authController = AuthController.to;


  void checkResultRoundOne(bool listenResult, bool hintResult, int index) {
    if (listenResult == true && hintResult == true) {
      rxProgressBarPoint += 1;
    } else {
      rxListWordRoundTwo.add(index);
    }
  }

  void checkResulRoundTwo(bool result, int index) {
    if (result) {
      rxProgressBarPoint += 1;
      rxListWordRoundTwo.removeWhere((element) => element == index);
    }
  }

  bool didLearnLesson(int indexTopic) {
    if (authController.rxFireStoreUser.value!.listLearnedLesson.isEmpty) {
      return false;
    }
    for (int i in authController.rxFireStoreUser.value!.listLearnedLesson) {
      if (i == indexTopic) {
        return true;
      }
    }
    return false;
  }

  void skipFlashCard(){
    rxProgressBarPoint += 1;
  }

  void resetLearning() {
    rxIsEndRoundOne = RxBool(false);
    rxListWordRoundTwo = RxList();
    rxProgressBarPoint = RxInt(0);
  }

  updateListLearnedLesson(int indexTopic){
    authController.rxFireStoreUser.value!.listLearnedLesson.add(indexTopic);
    authController.updateUserFireStore();
  }



}
