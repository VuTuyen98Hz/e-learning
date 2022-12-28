import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/helpers/show_answer.dart';
import '../../../models/word_model.dart';
import '../main/progress_bar_quiz2.dart';
import '../main/quiz_controller.dart';
import '../multiple_choice/multiple_choice_controller.dart';
import '../type_with_hint_quiz/type_with_hint_quiz_controller.dart';
import 'listen_and_type_quiz_controller.dart';

class ListenAndTypeQuiz extends GetView<ListenAndTypeQuizController> {
  const ListenAndTypeQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WordModel quizWord = Get.arguments;
    Get.put(QuizController());
    Get.put(MultipleChoiceController());
    Get.put(ListenAndTypeQuizController());
    Get.put(TypeWithHintQuizController());
    controller.audioPlayer.play(AssetSource(quizWord.audioAsset));
    return ProgressBarQuiz2(
      animationController: QuizController.to.animationController,
      child: Obx(
        () => Stack(alignment: Alignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
                child: Column(children: [
                  const Text("Nghe và viết lại",
                      style: TextStyle(color: Colors.black, fontSize: 30)),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () async {
                      controller.audioPlayer
                          .play(AssetSource(quizWord.audioAsset));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                      Icons.volume_down_alt,
                      color: Colors.yellow,
                      size: 25.0,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    enabled: controller.rxIsChangeButton.value == false
                        ? true
                        : false,
                    onChanged: (value) =>
                        controller.checkResult(value, quizWord),
                    controller: controller.inputController,
                    decoration: const InputDecoration(
                      hintText: "Gõ lại từ bạn vừa nghe thấy",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      )),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black45, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black45, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                child: Column(
                  children: [
                    controller.rxIsChangeButton.value == false
                        ? ElevatedButton(
                            onPressed: controller.rxShowCheckButton.value ==
                                    true
                                ? () {
                                    QuizController.to.plusProgressbarPoint(
                                        quizWord, controller.rxResult.value);
                                    controller.changeButton();
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(300, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Text(
                              'KIỂM TRA',
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              QuizController.to.startQuiz();
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(300, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Text(
                              'TIẾP TỤC',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
          controller.rxIsCheckButtonActive.value == true
              ? ShowAnswer(
                  result: controller.rxResult.value,
                  isVisibleMeaning: controller.rxIsVisibleMeaning.value,
                  word: quizWord.word,
                  phonetic: quizWord.phonetic,
                  pathAudio: quizWord.audioAsset,
                  vietnameseMeaning: quizWord.vietnameseMeaning,
                  example: quizWord.example,
                  translateExample: quizWord.translateExample)
              : Container(),
        ]),
      ),
    );
  }
}
