import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/word_model.dart';

class TypeWithHintController extends GetxController {
  late TextEditingController inputController;
  RxBool rxCheckButton = RxBool(false);
  RxBool rxCheckAnswer = RxBool(true);
  RxBool rxChangeButton = RxBool(false);
  RxBool rxIsCheckAnswerActive = RxBool(false);
  RxBool rxHintGameResult = RxBool(false);
  RxBool rxIsVisibleMeaning = RxBool(false);
  RxList<WordModel> rxListWord = RxList<WordModel>();

  @override
  void onInit() {
    super.onInit();
    inputController = TextEditingController();
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
