import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/learning/main/learning_controller.dart';
import '../../home/home.dart';

class ProgressBarLearning extends GetView<LearningController> {
  ProgressBarLearning({
    Key? key,
    required this.child,
  }) : super(key: key);
  final LearningController learnController = LearningController.to;
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
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            iconSize: 10,
                            icon: Image.asset("assets/icons/exit_icon.png"),
                            onPressed: () {
                              learnController.resetLearning();
                              Get.offAll(const HomeUI(),transition: Transition.fade);
                            }),
                        SizedBox(
                          width: size.width * 0.83,
                          height: 30,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: LinearProgressIndicator(
                              value: learnController.rxProgressBarPoint.value * 0.1,
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
