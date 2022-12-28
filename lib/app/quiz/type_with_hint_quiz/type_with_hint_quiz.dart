import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/helpers/text_form_field_fill_word.dart';
import 'package:learn_japanese/app/quiz/type_with_hint_quiz/type_with_hint_quiz_controller.dart';
import '../../../animation/slide_animation.dart';
import '../../../helpers/show_answer.dart';
import '../../../models/word_model.dart';
import '../listen_and_type_quiz/listen_and_type_quiz_controller.dart';
import '../main/progress_bar_quiz2.dart';
import '../main/quiz_controller.dart';
import '../multiple_choice/multiple_choice_controller.dart';

class TypeWithHintQuiz extends GetView<TypeWithHintQuizController> {
  const TypeWithHintQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WordModel quizWord = Get.arguments;
    Get.put(QuizController());
    Get.put(MultipleChoiceController());
    Get.put(ListenAndTypeQuizController());
    Get.put(TypeWithHintQuizController());
    return ProgressBarQuiz2(
      animationController: QuizController.to.animationController,
      child: Obx(
        () => Stack(alignment: Alignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideAnimation(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
                  child: Column(children: [
                    const Text("Điền Từ",
                        style: TextStyle(color: Colors.grey, fontSize: 30)),
                    const SizedBox(height: 20),
                    Text(quizWord.vietnameseMeaning,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 25)),
                    const SizedBox(height: 40),
                    TextFormFieldFillWord(
                      appContext: context,
                      length: quizWord.word.length,
                      onChanged: (value) =>
                          controller.checkResult(value, quizWord),
                      hintWord: quizWord.word,
                      showCursor: false,
                      readOnly: controller.rxIsChangeButton.value == true
                          ? true
                          : false,
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                child: Column(
                  children: [
                    if (controller.rxIsChangeButton.value == false)
                      ElevatedButton(
                        onPressed: controller.rxShowCheckButton.value == true
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
                    else
                      ElevatedButton(
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
