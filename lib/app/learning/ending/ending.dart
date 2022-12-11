import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main/learning_controller.dart';
import 'ending_controller.dart';
import 'select_word.dart';

class Ending extends StatelessWidget {
  Ending({this.indexTopic = 0, super.key});

  final int indexTopic;
  final LearningController learnController = LearningController.to;

  @override
  Widget build(BuildContext context) {
    Get.put(LearningController());
    return GetBuilder<EndingController>(
      init: EndingController(),
      builder: (controller) =>
          Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Text(
                  "Bạn đã học được 10 từ!",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
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
                  learnController.rxListLearnedTopic.add(indexTopic);
                  Get.to(SelectWord(),transition: Transition.fadeIn);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('TIẾP TỤC'),
              ),

            ]),
          ),
    );
  }
}
