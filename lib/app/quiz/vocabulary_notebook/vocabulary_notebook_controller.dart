import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/main/quiz_controller.dart';
import '../../../models/word_model.dart';

class VocabularyNotebookController extends GetxController {
  static VocabularyNotebookController to = Get.find();
  RxList<WordModel> rxListBeforeEditWord = RxList();
  RxList<WordModel> rxListAfterEditWord = RxList();
  RxList<WordModel> rxListWord = RxList<WordModel>();
  QuizController quizController = QuizController.to;


  RxList<WordModel> rxListTemporaryEdit= RxList();




  @override
  void onInit() {
    super.onInit();
    quizController.rxListQuizWord = rxListBeforeEditWord;
    debugPrint('Hello list ${rxListBeforeEditWord.length}');
  }

  manageSaveEditWord(bool isSave) {
      if(isSave==true){
        rxListBeforeEditWord = rxListAfterEditWord;
        // quizController.rxListQuizWord = rxListAfterEditWord;
      }else{
        rxListAfterEditWord = RxList();
      }
  }

}
