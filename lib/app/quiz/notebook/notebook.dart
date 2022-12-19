import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/main/quiz_controller.dart';
import '../../authentication/auth_controller.dart';
import 'selected_word.dart';
import '../../home/home.dart';
import '../../../models/topics_model.dart';

class Notebook extends GetView<QuizController> {
  Notebook({super.key});

  final user = AuthController.to.rxFireStoreUser.value!;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: listTopics.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              iconSize: 8,
              icon: Image.asset("assets/icons/exit_icon.png"),
              onPressed: () {
                AuthController.to.updateUserFireStore();
                Get.offAll(const HomeUI(),
                    arguments: 1, transition: Transition.fadeIn);
              }),
          centerTitle: true,
          title: const Text('Sổ tay từ vựng'),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              for (int i = 0; i < 10; i++) Tab(text: "Bài ${i + 1}"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            for (int i = 0; i < 10; i++) SelectedWord(indexTopic: i)
          ],
        ),
      ),
    );
  }
}
