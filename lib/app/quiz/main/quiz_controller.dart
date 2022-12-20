import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/listen_and_type_quiz/listen_and_type_quiz.dart';
import 'package:learn_japanese/app/quiz/main/quiz_screen.dart';
import 'package:learn_japanese/app/quiz/multiple_choice/multiple_choice.dart';
import '../../../helpers/random_index.dart';
import '../../../models/word_model.dart';
import '../../authentication/auth_controller.dart';
import '../listen_and_type_quiz/listen_and_type_quiz_controller.dart';
import '../multiple_choice/multiple_choice_controller.dart';
import '../summary/summary_screen.dart';
import '../type_with_hint_quiz/type_with_hint_quiz.dart';
import '../type_with_hint_quiz/type_with_hint_quiz_controller.dart';

class QuizController extends GetxController {
  static QuizController to = Get.find();
  RxInt rxProgressBarPoint = RxInt(0);
  List<StatisticalPoint> points = [];
  RxList<WordModel> rxListQuizWord = RxList();
  List<WordModel> listFalseWord = [];
  List<WordModel> listTrueWord = [];
  List<double> listResultQuiz = [];
  double resultQuiz = 0;
  String totalResult = '';
  int totalProgressBarPoint = 0;
  late List<Widget> listGameWidget;

  @override
  void onReady() {
    super.onReady();
    listGameWidget = [
      const MultipleChoice(),
      TypeWithHintQuiz(),
      ListenAndTypeQuiz()
    ];
  }

  void initQuiz() {
    Get.put(MultipleChoiceController());
    Get.put(ListenAndTypeQuizController());
    Get.put(TypeWithHintQuizController());
    final user = AuthController.to.rxFireStoreUser.value!;
    rxListQuizWord.value = user.listQuizWord;
    totalProgressBarPoint = user.listQuizWord.length;
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
      AuthController.to.updateFinishQuiz();
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

  void plusProgressbarPoint(WordModel quizWord, bool result) {
    // True at the 1st times appear
    if (result == true && listFalseWord.contains(quizWord) == false) {
      rxProgressBarPoint.value += 1;
      listTrueWord.add(quizWord);
      rxListQuizWord.removeWhere((word) => word == quizWord);
      // True after the 1st times appear
    } else if (result == true) {
      rxProgressBarPoint.value += 1;
      rxListQuizWord.removeWhere((word) => word == quizWord);
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

  List<BarChartGroupData> chartGroups() {
    points = getBartChartPoints(resultQuiz);
    return points
        .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
              BarChartRodData(
                toY: point.y,
                width: 40,
                color: Colors.lightGreen,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              )
            ]))
        .toList();
  }
  void initBarCharPoints(){
    final user = AuthController.to.rxFireStoreUser.value!;
    List<int> listNumberTrueResult = user.barChartData!.listNumberTrueResult;
    List<int> listNumberTotalResult = user.barChartData!.listNumberTotalResult;
  }

  void setBarChartPoints(double resultQuiz) {
    // keep only the last 5 resultQuiz
    if (listResultQuiz.length == 5) {
      listResultQuiz.removeAt(0);
      listResultQuiz.add(resultQuiz);
    } else {
      listResultQuiz.add(resultQuiz);
    }
  }

  List<StatisticalPoint> getBartChartPoints(double resultQuiz) {
    return listResultQuiz
        .mapIndexed((index, element) =>
            StatisticalPoint(x: index.toDouble(), y: element))
        .toList();
  }
  String getSummaryResulByString(int listTrue, int listTotal){
    return "${resultQuiz.toInt()}\n%($totalResult)";
  }

  String getTopTitlesValue(){
    final result = listResultQuiz.where((result) =>result ==resultQuiz);
    return "${result.first.toInt()}% ($totalResult)";
  }

  double totalCorrect(List<WordModel> listTrueWord, List<WordModel> listTotal) {
    if (listTotal.isEmpty) {
      return 0;
    } else {
      double total = (listTrueWord.length / listTotal.length) * 100;
      return total;
    }
  }


  void resetToZero() {
    listFalseWord = [];
    listTrueWord = [];
    rxProgressBarPoint = RxInt(0);
    // resultQuiz = 0;
  }
}
