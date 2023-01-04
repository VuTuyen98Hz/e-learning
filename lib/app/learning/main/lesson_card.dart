import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/lesson_topic_model.dart';
import 'learning_controller.dart';

Widget lessonCard(LessonTopicModel topic, int indexLesson) {
  final learnController = Get.put(LearningController());
  final status = learnController.didFinishedLesson(indexLesson);
  return Card(
    elevation: 2.0,
    color: status == true ? Colors.green : Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    margin: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(topic.imageAssets),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.green),
                shape: BoxShape.circle),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topic.descriptions,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: status == true ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Text(
                    topic.meaning,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: status == true ? Colors.white : Colors.black),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
