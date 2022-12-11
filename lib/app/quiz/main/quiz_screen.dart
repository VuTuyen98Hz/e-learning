import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../multiple_choice/multiple_choice.dart';
import 'quiz_controller.dart';
import 'package:collection/collection.dart';
import 'dart:math';

class QuizScreen extends GetView<QuizController> {
  QuizScreen({super.key});

  final List<PricePoint> points = pricePoints;
  final int numberReviewWord = 8;

  @override
  Widget build(BuildContext context) {
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
          Text("Chuẩn bị ôn tập: $numberReviewWord từ",
              style: const TextStyle(fontSize: 18, color: Colors.black)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.to(MultipleChoice());
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(220, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            child: const Text('ÔN TẬP NGAY', style: TextStyle(fontSize: 20)),
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
  final Random random = Random();
  final randomNumbers = <double>[0, 5, 5, 5, 10];
  // for (var i = 0; i <= 11; i++) {
  //   randomNumbers.add(random.nextDouble());
  // }

  return randomNumbers
      .mapIndexed(
          (index, element) => PricePoint(x: index.toDouble(), y: element))
      .toList();
}
