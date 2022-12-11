import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/word_model.dart';

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

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
