import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/word_model.dart';
import '../ending/ending.dart';
import '../flashcard/flashcard.dart';
import '../main/learning_controller.dart';
import '../type_with_hint/type_with_hint.dart';
import '../type_with_hint/type_with_hint_controller.dart';

class FlashCardController extends GetxController {
  RxBool changeFlashcard = RxBool(false);
  RxBool rxFirstTap = RxBool(false);
  RxBool rxIsDelayTextButton = RxBool(true);
  RxList<WordModel> rxListWord = RxList<WordModel>();
  RxInt rxIndex = RxInt(0);
  final audioPlayer = AudioPlayer();

  @override
  void onReady() {
    Timer(const Duration(milliseconds: 300), () {
      rxIsDelayTextButton.value = false;
    });
    audioPlayer.play(AssetSource(rxListWord[rxIndex.value].audioAsset));
    debugPrint("Hello again");
  }

  void skipWord(int index, int indexLesson) {
    final learnController = LearningController.to;
    if (index < rxListWord.length - 1) {
      learnController.rxProgressBarPoint += 1;
      learnController.animationController.forward();

      Get.offAll(FlashCard(index: index + 1, indexLesson: indexLesson),
          transition: Transition.fadeIn);
      Get.put(FlashCardController());
    } else {
      learnController.rxIsEndRoundOne.value = true;
      learnController.rxProgressBarPoint += 1;
      learnController.animationController.forward();
      if (learnController.rxListWordRoundTwo.isNotEmpty) {
        Get.offAll(
            TypeWithHint(
                index: learnController.rxListWordRoundTwo.first,
                indexLesson: indexLesson),
            transition: Transition.fadeIn);
        Get.put(TypeWithHintController());
      } else {
        learnController.rxProgressBarPoint += 1;
        learnController.animationController.forward();
        Timer(const Duration(milliseconds: 600), () {
          learnController.resetLearning();
          Get.off(Ending(indexLesson: indexLesson),
              transition: Transition.fadeIn);
        });
      }
    }
  }
}
