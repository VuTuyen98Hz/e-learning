import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/learning/flashcard/flashcard.dart';
import '../../../models/topics_model.dart';
import '../flashcard/flashcard_controller.dart';
import 'topic_card.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: listTopics.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.put(FlashCardController());
                  Get.to(() => FlashCard(indexTopic: index),transition: Transition.fadeIn);
                },
                child: topicCard(listTopics[index], index),
              );
            }));
  }
}
