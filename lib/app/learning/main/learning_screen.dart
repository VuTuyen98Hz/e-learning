import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/learning/flashcard/flashcard.dart';
import '../../authentication/profile_screen.dart';
import '../../../models/topics_model.dart';
import '../flashcard/flashcard_controller.dart';
import 'learning_card.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              iconSize: 8,
              icon: Image.asset("assets/icons/user_icon.png"),
              onPressed: () {
                Get.to(const ProfileScreen(),transition: Transition.upToDown);
              }),
          centerTitle: true,
          title: const Text('Học tập'),
        ),
        body: ListView.builder(
            itemCount: listTopics.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.put(FlashCardController());
                  Get.to(() => FlashCard(indexTopic: index),transition: Transition.fadeIn);
                },
                child: lessonCard(listTopics[index], index),
              );
            }));
  }
}
