import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../authentication/auth_controller.dart';
import '../../authentication/signin_screen.dart';
import '../notebook/notebook.dart';
import 'quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});
  // final quizController = QuizController.to;
  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    QuizController.to.initQuiz();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Thống kê ôn tập",
              style: TextStyle(fontSize: 20, color: Colors.black)),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
            height: 260,
            child: BarChart(
              swapAnimationDuration: const Duration(milliseconds: 1000),
              BarChartData(
                // maxY: 10.0,
                // baselineY: 10.0,
                barGroups: QuizController.to.chartGroups(),
                barTouchData: BarTouchData(enabled: false),
                borderData:
                    FlBorderData(border: const Border(bottom: BorderSide())),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(sideTitles: topTitles()),
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
              ),
            ),
          ),
          Text("Chuẩn bị ôn tập: ${QuizController.to.rxListQuizWord.length} từ",
              style: const TextStyle(fontSize: 18, color: Colors.black)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: QuizController.to.rxListQuizWord.isEmpty
                ? null
                : () => QuizController.to.startQuiz(),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(220, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            child: const Text('ÔN TẬP NGAY', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
              iconSize: 40,
              icon: Image.asset(
                "assets/icons/book_icon.png",
              ),
              onPressed: () {
                Get.off(Notebook(), transition: Transition.fadeIn);
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

  SideTitles topTitles() {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 0:
            text = QuizController.to.getTopTitleBarChart(value.toInt());
            break;
          case 1:
            text = QuizController.to.getTopTitleBarChart(value.toInt());
            break;
          case 2:
            text = QuizController.to.getTopTitleBarChart(value.toInt());
            break;
          case 3:
            text = QuizController.to.getTopTitleBarChart(value.toInt());
            break;
          case 4:
            text = QuizController.to.getTopTitleBarChart(value.toInt());
            break;
        }
        return Text(text, style: const TextStyle(color: Colors.black));
      },
    );
  }
}

SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 0:
            text = 'Lần 1';
            break;
          case 1:
            text = 'Lần 2';
            break;
          case 2:
            text = 'Lần 3';
            break;
          case 3:
            text = 'Lần 4';
            break;
          case 4:
            text = 'Lần 5';
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

class StatisticalPoint {
  final double x;
  final double y;

  StatisticalPoint({required this.x, required this.y});
}
