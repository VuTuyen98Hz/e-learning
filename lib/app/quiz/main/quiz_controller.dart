import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/listen_and_type_quiz/listen_and_type_quiz.dart';
import 'package:learn_japanese/app/quiz/multiple_choice/multiple_choice.dart';
import '../../../helpers/random_index.dart';
import '../../../models/word_model.dart';
import '../../home/home.dart';
import '../type_with_hint_quiz/type_with_hint_quiz.dart';

class QuizController extends GetxController {
  static QuizController to = Get.find();
  RxBool rxIsEndRoundOne = RxBool(false);
  RxInt rxProgressBarPoint = RxInt(0);
  RxList<WordModel> rxListQuizWord = RxList();
  late List<Widget> listGameWidget;

  @override
  void onReady() {
    super.onReady();
    listGameWidget = [
      MultipleChoice(),
      TypeWithHintQuiz(),
      ListenAndTypeQuiz()
    ];
  }

  //Start Quiz with randomGame
  void startQuiz() {
    if (randomQuizWord() != null) {
      Get.offAll(listGameWidget[randomIndex(min:0, max:3)],
          arguments: randomQuizWord(), transition: Transition.fadeIn);
    } else {
      Get.offAll(const HomeUI());
    }
  }

  plusProgressbarPoint(WordModel quizWord, bool value) {
    if (value == true) {
      rxListQuizWord.removeWhere((word) => word == quizWord);
      rxProgressBarPoint.value += 1;
    }
  }

  WordModel? randomQuizWord() {
    if (rxListQuizWord.isNotEmpty) {
      final quizWord = rxListQuizWord[randomIndex(min: 0, max: rxListQuizWord.length)];
      return quizWord;
    } else {
      return null;
    }
  }

  void resetToZero() {
    rxIsEndRoundOne = RxBool(false);
    rxProgressBarPoint = RxInt(0);
  }
}
