import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/word_model.dart';


class ListenAndTypeQuizController extends GetxController {
  late TextEditingController inputController;
  RxBool rxShowCheckButton = RxBool(false);
  RxBool rxIsChangeButton = RxBool(false);
  RxBool rxIsCheckButtonActive = RxBool(false);
  RxBool rxResult = RxBool(false);
  RxBool rxIsVisibleMeaning = RxBool(false);
  final audioPlayer = AudioPlayer();


  @override
  void onInit() {
    super.onInit();
    inputController = TextEditingController();
    audioPlayer.onPlayerStateChanged.listen((state) {
      state == PlayerState.playing;
    });
  }

  checkResult(String value, WordModel quizWord){
      if (value.isNotEmpty) {
        rxShowCheckButton.value = true;
        if (value.toLowerCase().trim() ==quizWord.word) {
          rxResult.value = true;
        } else {
          rxResult.value = false;
        }
      } else {
        rxShowCheckButton.value = false;
      }
  }


  void changeButton() {
    rxIsCheckButtonActive.value = true;
    rxIsChangeButton.value = true;
    FocusManager.instance.primaryFocus?.unfocus();
  }





}
