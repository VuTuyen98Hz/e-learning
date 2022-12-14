import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/vocabulary_notebook/vocabulary_notebook.dart';
import '../../../models/word_model.dart';
import '../../authentication/auth_controller.dart';
import '../../authentication/signin_screen.dart';
import '../../home/home.dart';
import '../vocabulary_notebook/vocabulary_notebook_controller.dart';
import 'quiz_controller.dart';
import '../listen_and_type_quiz/listen_and_type_quiz_controller.dart';
import '../multiple_choice/multiple_choice_controller.dart';
import '../type_with_hint_quiz/type_with_hint_quiz_controller.dart';
import 'package:collection/collection.dart';

class QuizScreen extends GetView<QuizController> {
  QuizScreen({super.key});
  final List<PricePoint> points = pricePoints;
  QuizController quizController = QuizController.to;

  @override
  Widget build(BuildContext context) {
    Get.put(MultipleChoiceController());
    Get.put(ListenAndTypeQuizController());
    Get.put(TypeWithHintQuizController());
    controller.rxListQuizWord.value = listLesson[0].listWord;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Thống kê ôn tập",
              style: TextStyle(fontSize: 20, color: Colors.black)),
          Container(
            padding: const EdgeInsets.fromLTRB(60, 30, 60, 30),
            height: 260,
            child: BarChart(
              BarChartData(
                barGroups: _chartGroups(),
                barTouchData: BarTouchData(enabled: false),
                borderData:
                    FlBorderData(border: const Border(bottom: BorderSide())),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(sideTitles: _topTitles),
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
          Text("Chuẩn bị ôn tập: ${controller.rxListQuizWord.length} từ",
              style: const TextStyle(fontSize: 18, color: Colors.black)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: ()=> controller.rxListQuizWord.isEmpty? Get.to(const HomeUI())  : controller.startQuiz(),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(220, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            child: Text(controller.rxListQuizWord.isEmpty? 'ĐI TỚI HỌC TẬP' : 'ÔN TẬP NGAY', style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
              iconSize: 40,
              icon: Image.asset(
                "assets/icons/book_icon.png",
              ),
              onPressed: () {
                Get.to(const VocabularyNotebook(),transition: Transition.fadeIn);
                Get.put(VocabularyNotebookController());
              },
            ),
            const Text("Sổ tay từ vựng",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18)),
          ]),
          ElevatedButton(
            onPressed: () {
              AuthController.to.logoutFacebook();
              AuthController.to.logoutGoogle();
              AuthController.to.signOut();
              Get.offAll(SignInScreen());
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text('Thoát tài khoản'),
          ),
        ],
      )),
    );
  }

  // List<BarChartGroupData> _chartGroups() {
  //   return points
  //       .map((point) => BarChartGroupData(
  //           x: point.x.toInt(), barRods: [BarChartRodData(toY: point.y)]))
  //       .toList();
  // }
  List<BarChartGroupData> _chartGroups() {
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

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = '1';
              break;
            case 1:
              text = '2';
              break;
            case 2:
              text = '3';
              break;
            case 3:
              text = '4';
              break;
            case 4:
              text = '5';
              break;
          }
          return Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              ));
        },
      );

  SideTitles get _topTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = '0%';
              break;
            case 1:
              text = '50%';
              break;
            case 2:
              text = '50%';
              break;
            case 3:
              text = '50%';
              break;
            case 4:
              text = '100%';
              break;
          }
          return Text(text, style: const TextStyle(color: Colors.black));
        },
      );
}

class PricePoint {
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});
}

List<PricePoint> get pricePoints {
  // final Random random = Random();
  final randomNumbers = <double>[0, 5, 5, 5, 10];
  // for (var i = 0; i <= 11; i++) {
  //   randomNumbers.add(random.nextDouble());
  // }
  return randomNumbers
      .mapIndexed(
          (index, element) => PricePoint(x: index.toDouble(), y: element))
      .toList();
}
