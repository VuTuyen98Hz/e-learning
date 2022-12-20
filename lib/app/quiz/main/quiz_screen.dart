import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../authentication/auth_controller.dart';
import '../../authentication/signin_screen.dart';
import '../../home/home.dart';
import '../notebook/notebook.dart';
import 'quiz_controller.dart';

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({super.key});

  // final quizController = QuizController.to;
  @override
  Widget build(BuildContext context) {
    controller.initQuiz();
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
                barGroups: controller.chartGroups(),
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
          Text("Chuẩn bị ôn tập: ${controller.rxListQuizWord.length} từ",
              style: const TextStyle(fontSize: 18, color: Colors.black)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => controller.rxListQuizWord.isEmpty
                ? Get.to(const HomeUI(),
                    arguments: 0, transition: Transition.fadeIn)
                : controller.startQuiz(),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(220, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            child: Text(
                controller.rxListQuizWord.isEmpty
                    ? 'ĐI TỚI HỌC TẬP'
                    : 'ÔN TẬP NGAY',
                style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
              iconSize: 40,
              icon: Image.asset(
                "assets/icons/book_icon.png",
              ),
              onPressed: () {
                Get.to(Notebook(), transition: Transition.fadeIn);
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
            text = controller.getTopTitlesValue();
            break;
          case 1:
            text = controller.getTopTitlesValue();
            break;
          case 2:
            text = controller.getTopTitlesValue();
            break;
          case 3:
            text = controller.getTopTitlesValue();
            break;
          case 4:
            text = controller.getTopTitlesValue();
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
