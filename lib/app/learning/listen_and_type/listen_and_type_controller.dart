import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/random_index.dart';
import '../../../models/word_model.dart';
import '../ending/ending.dart';
import '../main/learning_controller.dart';
import '../type_with_hint/type_with_hint.dart';
import '../type_with_hint/type_with_hint_controller.dart';

class ListenAndTypeController extends GetxController {
  late TextEditingController inputController;
  RxBool rxCheckButton = RxBool(false);
  RxBool rxCheckAnswer = RxBool(true);
  RxBool rxChangeButton = RxBool(false);
  RxBool rxIsCheckAnswerActive = RxBool(false);
  RxBool rxListenResult = RxBool(false);
  RxBool rxIsVisibleMeaning = RxBool(false);
  RxList<WordModel> rxListWord = RxList<WordModel>();
  RxInt rxIndex = RxInt(0);
  final audioPlayer = AudioPlayer();
  final LearningController learnController = LearningController.to;

  @override
  void onInit() {
    super.onInit();
    inputController = TextEditingController();
    audioPlayer.onPlayerStateChanged.listen((state) {
      state == PlayerState.playing;
    });
  }


  @override
  void onReady() {
    audioPlayer.play(AssetSource(rxListWord[rxIndex.value].audioAsset));
  }

  void onChangedTextFormField(String value, int index) {
    if (value.isNotEmpty) {
      rxCheckButton.value = true;
      if (value.toLowerCase() == rxListWord[index].word) {
        rxListenResult.value = true;
      } else {
        rxListenResult.value = false;
      }
    } else {
      rxCheckButton.value = false;
    }
  }

  void onContinue(int index, int indexLesson) {
    //run round one
    if (index < rxListWord.length &&
        learnController.rxIsEndRoundOne.value == false) {
      Get.offAll(TypeWithHint(
          listenGameResult: rxListenResult.value,
          index: index,
          indexLesson: indexLesson));
      Get.put(TypeWithHintController());
    } else {
      // run round two
      if (learnController.rxListWordRoundTwo.isNotEmpty) {
        int index = randomIndex(
            max: learnController
                .rxListWordRoundTwo.length);
        Get.offAll(
            TypeWithHint(
              index: learnController.rxListWordRoundTwo[index],
              indexLesson: indexLesson,
            ),
            transition: Transition.fadeIn);
        Get.put(TypeWithHintController());
      } else {
        learnController.resetLearning();
        Get.offAll(Ending(indexLesson: indexLesson),
            transition: Transition.fadeIn);
      }
    }
  }

  void onCheck(int index) {
    rxIsCheckAnswerActive.value = true;
    rxChangeButton.value = true;
    FocusManager.instance.primaryFocus?.unfocus();
    // run round two
    if (learnController.rxIsEndRoundOne.value == true) {
      learnController.checkResulRoundTwo(
          rxListenResult.value, index);
    }
  }


}
