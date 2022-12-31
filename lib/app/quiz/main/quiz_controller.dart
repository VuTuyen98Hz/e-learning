import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/listen_and_type_quiz/listen_and_type_quiz.dart';
import 'package:learn_japanese/app/quiz/main/quiz_screen.dart';
import 'package:learn_japanese/app/quiz/multiple_choice/multiple_choice.dart';
import 'package:learn_japanese/models/models.dart';
import '../../../helpers/random_index.dart';
import '../../authentication/auth_controller.dart';
import '../listen_and_type_quiz/listen_and_type_quiz_controller.dart';
import '../multiple_choice/multiple_choice_controller.dart';
import '../summary/summary_screen.dart';
import '../type_with_hint_quiz/type_with_hint_quiz.dart';
import '../type_with_hint_quiz/type_with_hint_quiz_controller.dart';

class QuizController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static QuizController to = Get.find();
  RxInt rxProgressBarPoint = RxInt(0);
  List<StatisticalPoint> points = [];
  RxList<WordModel> rxListQuizWord = RxList();
  List<WordModel> listFalseWord = [];
  List<WordModel> listTrueWord = [];
  List<WordModel> listQuizWordOriginal = [];
  int totalProgressBarPoint = 0;
  late List<Widget> listGameWidget;
  UserModel user = UserModel();

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

  @override
  void onReady() {
    super.onReady();
    listGameWidget = [
      const MultipleChoice(),
      const TypeWithHintQuiz(),
      const ListenAndTypeQuiz()
    ];
  }

  void initQuiz() {
    Get.put(MultipleChoiceController());
    Get.put(ListenAndTypeQuizController());
    Get.put(TypeWithHintQuizController());
    user = AuthController.to.rxFireStoreUser.value!;
    rxListQuizWord.value = user.listQuizWord;
    totalProgressBarPoint = user.listQuizWord.length;
    listQuizWordOriginal = [...user.listQuizWord];
  }

  //Start Quiz with randomGame
  void startQuiz() {
    if (randomQuizWord() != null) {
      Get.offAll(listGameWidget[randomIndex(min: 0, max: 3)],
          arguments: randomQuizWord(), transition: Transition.fadeIn);
    } else {
      endQuiz();
    }
  }

  void endQuiz() {
    if (listFalseWord.isEmpty && listTrueWord.isEmpty) {
      List<WordModel> emptyList = [];
      Get.offAll(const SummaryScreen(),
          arguments: [emptyList, emptyList], transition: Transition.fadeIn);
    } else {
      List<WordModel> listTotal = listFalseWord + listTrueWord;
      Get.offAll(const SummaryScreen(),
          arguments: [listTotal, listTrueWord], transition: Transition.fadeIn);
    }
  }

  WordModel? randomQuizWord() {
    if (rxListQuizWord.isNotEmpty) {
      final quizWord =
          rxListQuizWord[randomIndex(min: 0, max: rxListQuizWord.length)];
      return quizWord;
    } else {
      return null;
    }
  }

  void resetQuiz() {
    listFalseWord = [];
    listTrueWord = [];
    rxProgressBarPoint = RxInt(0);
    animationController.reset();
  }

  //Control Progressbar
  void plusProgressbarPoint(WordModel quizWord, bool result) {
    // True at the 1st times appear
    if (result == true && listFalseWord.contains(quizWord) == false) {
      rxProgressBarPoint.value += 1;
      listTrueWord.add(quizWord);
      rxListQuizWord.removeWhere((word) => word == quizWord);
      animationController.forward();
      // True after the 1st times appear
    } else if (result == true) {
      rxProgressBarPoint.value += 1;
      rxListQuizWord.removeWhere((word) => word == quizWord);
      animationController.forward();
    } else {
      //Prevent duplicate word
      if (listFalseWord.contains(quizWord) == false) {
        listFalseWord.add(quizWord);
      }
    }
  }

  double calculateProgressbar() {
    return (rxProgressBarPoint.value / totalProgressBarPoint);
  }

  // Control BarChart
  List<BarChartGroupData> chartGroups() {
    points = getBartChartPoints();
    return points
        .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
              BarChartRodData(
                toY: point.y,
                width: 40,
                color: Colors.greenAccent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              )
            ]))
        .toList();
  }

  List<StatisticalPoint> getBartChartPoints() {
    final listResultQuiz = getBarChartValue();
    return listResultQuiz
        .mapIndexed((index, element) =>
            StatisticalPoint(x: index.toDouble(), y: element * 0.1))
        .toList();
  }

  List<double> getBarChartValue() {
    return user.listValueBarChart;
  }

  String getTopTitleBarChart(int index) {
    return user.listTopTitleBarChart[index];
  }

  double calculatePercent(int lengthListTrueWord, int lengthListTotal) {
    if (lengthListTotal == 0) {
      return 0;
    } else {
      double total = ((lengthListTrueWord / lengthListTotal) * 100);
      return total;
    }
  }
}
