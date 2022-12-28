import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/authentication/auth_controller.dart';

import '../../../models/word_model.dart';

class LearningController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static LearningController to = Get.find();
  RxBool rxIsEndRoundOne = RxBool(false);
  RxList<WordModel> rxListWord = RxList<WordModel>();
  RxList<int> rxListWordRoundTwo = RxList();
  RxInt rxProgressBarPoint = RxInt(0);

  RxDouble rxAnimationValue = RxDouble(0);
  late AnimationController animationController;
  late Animation<Offset> offsetAnimation;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    super.onInit();
  }

  void checkResultRoundOne(bool listenResult, bool hintResult, int index) {
    if (listenResult == true && hintResult == true) {
      rxProgressBarPoint += 1;
      animationController.forward();
    } else {
      rxListWordRoundTwo.add(index);
    }
  }

  void checkResulRoundTwo(bool result, int index) {
    if (result) {
      rxProgressBarPoint += 1;
      animationController.forward();
      rxListWordRoundTwo.removeWhere((element) => element == index);
    }
  }

  void plusProgressbarPoint(){
        rxProgressBarPoint += 1;
        animationController.forward();
  }



  bool didFinishedLesson(int indexTopic) {
    final fireStoreUser = AuthController.to.rxFireStoreUser.value!;
    if (fireStoreUser.listFinishedLesson.contains(indexTopic)) {
      return true;
    } else {
      return false;
    }
  }

  void skipFlashCard() {
    rxProgressBarPoint += 1;
    animationController.forward();
  }

  void resetLearning() {
    rxIsEndRoundOne = RxBool(false);
    rxListWordRoundTwo = RxList();
    rxProgressBarPoint = RxInt(0);
    animationController.reset();
  }
}
