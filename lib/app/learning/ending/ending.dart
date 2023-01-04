import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/home/home.dart';
import '../../authentication/auth_controller.dart';
import '../main/learning_controller.dart';
import 'ending2.dart';

class Ending extends GetView<AuthController> {
  const Ending({this.indexLesson = 0, super.key});

  final int indexLesson;

  @override
  Widget build(BuildContext context) {
    final audio = AudioPlayer();
    audio.play(AssetSource("audio/sound_effect/congratulations.mp3"));
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
            if (LearningController.to.didFinishedLesson(indexLesson) == false) {
              controller.updateFinishLesson(indexLesson);
              Get.offAll(Ending2(indexLesson: indexLesson),
                  transition: Transition.fadeIn);
            } else {
              Get.offAll(const HomeUI(), transition: Transition.fadeIn);
            }
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(LearningController.to.didFinishedLesson(indexLesson)==false
              ? "TIẾP TỤC"
              : "TRỞ VỀ"),
        ),
      ]),
    );
  }
}
