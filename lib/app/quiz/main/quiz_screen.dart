import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/home/no_internet.dart';
import '../../../animation/bouncing_animation.dart';
import '../../authentication/profile_screen.dart';
import '../../home/home_controller.dart';
import '../../home/test_screen.dart';
import '../notebook/notebook.dart';
import 'quiz_controller.dart';

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    final homeController = Get.put(HomeController());
    controller.initQuiz();
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            leading: IconButton(
                iconSize: 8,
                icon: Image.asset("assets/icons/user_icon.png"),
                onPressed: () {
                  Get.to(const ProfileScreen(),
                      transition: Transition.upToDown);
                }),
            centerTitle: true,
            title: const Text('Ôn tập từ vựng'),
          ),
          body: homeController.rxConnectionType.value != 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Thống kê ôn tập",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    const SizedBox(height: 20),
                    Container(
                        padding: const EdgeInsets.fromLTRB(10, 15, 20, 20),
                        width: 350,
                        height: 260,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: controller.user.listValueBarChart.isNotEmpty
                            ? BarChart(
                                swapAnimationDuration:
                                    const Duration(milliseconds: 5000),
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 10,
                                  groupsSpace: 5,
                                  barGroups: QuizController.to.chartGroups(),
                                  barTouchData: BarTouchData(enabled: false),
                                  borderData: FlBorderData(
                                      border:
                                          const Border(bottom: BorderSide())),
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(
                                    topTitles:
                                        AxisTitles(sideTitles: topTitles()),
                                    bottomTitles:
                                        AxisTitles(sideTitles: _bottomTitles),
                                    leftTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    rightTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text("Chưa có thống kế nào",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black)))),
                    const SizedBox(height: 40),
                    Text(
                        "Chuẩn bị ôn tập: ${QuizController.to.rxListQuizWord.length} từ",
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.rxListQuizWord.isEmpty
                          ? null
                          : () => controller.startQuiz(),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(220, 55),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: const Text('ÔN TẬP NGAY',
                          style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(height: 50),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                        iconSize: 40,
                        icon: Image.asset(
                          "assets/icons/book_icon.png",
                        ),
                        onPressed: () {
                          Get.off(const Notebook(),
                              transition: Transition.fadeIn);
                        },
                      ),
                      const Text("Sổ tay từ vựng",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                    ]),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const TestScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text('Test Screen',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ],
                )
              : noInternet()),
    );
  }

  SideTitles topTitles() {
    return SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 0:
            text = controller.getTopTitleBarChart(value.toInt());
            break;
          case 1:
            text = controller.getTopTitleBarChart(value.toInt());
            break;
          case 2:
            text = controller.getTopTitleBarChart(value.toInt());
            break;
          case 3:
            text = controller.getTopTitleBarChart(value.toInt());
            break;
          case 4:
            text = controller.getTopTitleBarChart(value.toInt());
            break;
        }
        return Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Text(text, style: const TextStyle(color: Colors.black)));
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
            padding: const EdgeInsets.only(top: 5),
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
