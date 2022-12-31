import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/home/no_internet.dart';
import 'package:learn_japanese/app/learning/flashcard/flashcard.dart';
import '../../../animation/bouncing_animation.dart';
import '../../authentication/profile_screen.dart';
import '../../../models/lesson_topic_model.dart';
import '../../home/home_controller.dart';
import '../flashcard/flashcard_controller.dart';
import 'lesson_card.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
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
            title: const Text('Học tập'),
          ),
          body: homeController.rxConnectionType.value != 0
              ? ListView.builder(
                  itemCount: listLessonTopics.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.put(FlashCardController());
                        Get.to(() => FlashCard(indexLesson: index),
                            transition: Transition.fadeIn);
                      },
                      child: lessonCard(listLessonTopics[index], index),
                    );
                  })
              : noInternet()),
    );
  }
}
