import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/home.dart';
import 'quiz_controller.dart';

class ProgressBarQuiz extends GetView<QuizController> {
  ProgressBarQuiz({
    Key? key,
    required this.child,
  }) : super(key: key);
  final QuizController quizController = QuizController.to;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() => Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        iconSize: 10,
                        icon: Image.asset("assets/icons/exit_icon.png"),
                        onPressed: () {
                          quizController.resetToZero();
                          Get.offAll(HomeUI());
                        }),
                    SizedBox(
                      width: size.width * 0.83,
                      height: 30,
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20)),
                        child: LinearProgressIndicator(
                          value: quizController.rxProgressBarPoint.value * 0.1,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.blue),
                          backgroundColor: const Color(0xffD6D6D6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(child: child),
            ]),
      ),
    ));
  }
}
