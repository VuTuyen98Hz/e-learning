import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/notebook/selected_word.dart';
import '../../authentication/auth_controller.dart';

import '../main/learning_controller.dart';
import 'ending2.dart';

class Ending extends GetView<AuthController> {
  const Ending({this.indexTopic = 0, super.key});

  final int indexTopic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(
          child: Text(
            "Bạn đã học được 10 từ!",
            style: TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 350,
          width: 350,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/cheering.jpg")),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.updateFinishLesson(indexTopic);
            Get.offAll(Ending2(indexTopic: indexTopic),
                transition: Transition.fadeIn);
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: const Text('TIẾP TỤC'),
        ),
      ]),
    );
  }
}
