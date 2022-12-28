import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/learning/flashcard/flashcard.dart';
import 'package:learn_japanese/app/learning/listen_and_type/listen_and_type.dart';
import 'package:learn_japanese/app/learning/type_with_hint/type_with_hint_controller.dart';
import '../../../animation/slide_animation.dart';
import '../../../helpers/helpers.dart';
import '../../../models/lesson_model.dart';
import '../flashcard/flashcard_controller.dart';
import '../listen_and_type/listen_and_type_controller.dart';
import '../main/learning_controller.dart';
import '../ending/ending.dart';
import '../main/progress_bar_learning2.dart';

class TypeWithHint extends GetView<TypeWithHintController> {
  TypeWithHint(
      {this.listenGameResult = false,
      this.index = 0,
      this.indexTopic = 0,
      Key? key})
      : super(key: key);

  final LearningController learnController = LearningController.to;
  final bool listenGameResult;
  final int indexTopic;
  int index;

  @override
  Widget build(BuildContext context) {
    controller.rxListWord.value = listLessonModel[indexTopic].lesson;
    return ProgressBarLearning2(
      animationController: LearningController.to.animationController,
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
                    Text(controller.rxListWord[index].vietnameseMeaning,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 25)),
                    const SizedBox(height: 40),
                    TextFormFieldFillWord(
                      appContext: context,
                      length: controller.rxListWord[index].word.length,
                      onChanged: (value) {
                        if (value.length ==
                            controller.rxListWord[index].word.length) {
                          controller.rxCheckButton.value = true;
                          if (value.toLowerCase().trim() ==
                              controller.rxListWord[index].word) {
                            controller.rxHintGameResult.value = true;
                          } else {
                            controller.rxHintGameResult.value = false;
                          }
                        } else {
                          controller.rxCheckButton.value = false;
                        }
                      },
                      hintWord: controller.rxListWord[index].word,
                      showCursor: false,
                      readOnly: controller.rxChangeButton.value == true
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
                    if (controller.rxChangeButton.value == false)
                      ElevatedButton(
                        onPressed: controller.rxCheckButton.value == true
                            ? () {
                                controller.rxIsCheckAnswerActive.value = true;
                                controller.rxChangeButton.value = true;
                                FocusManager.instance.primaryFocus?.unfocus();
                                // add to run round two
                                learnController.checkResultRoundOne(
                                    listenGameResult,
                                    controller.rxHintGameResult.value,
                                    index);
                                // run round two
                                if (learnController.rxIsEndRoundOne.value ==
                                    true) {
                                  learnController.checkResulRoundTwo(
                                      controller.rxHintGameResult.value, index);
                                }
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
                          //change to round two
                          if (index == controller.rxListWord.length - 1 &&
                              learnController.rxIsEndRoundOne.value == false) {
                            learnController.rxIsEndRoundOne.value = true;
                            index = 0;
                          }
                          // run round one
                          if (index < controller.rxListWord.length - 1 &&
                              learnController.rxIsEndRoundOne.value == false) {
                            Get.offAll(
                                FlashCard(
                                    index: index + 1, indexTopic: indexTopic),
                                transition: Transition.fadeIn);
                            Get.put(FlashCardController());
                          } else {
                            //reset ListWordRoundTwo
                            if (index + 1 >=
                                learnController.rxListWordRoundTwo.length) {
                              index = 0;
                            } else {
                              index += 1;
                            }
                            // run round two
                            if (learnController.rxListWordRoundTwo.isNotEmpty) {
                              Get.offAll(
                                  ListenAndType(
                                      index: learnController
                                          .rxListWordRoundTwo[index],
                                      indexTopic: indexTopic),
                                  transition: Transition.fadeIn);
                              Get.put(ListenAndTypeController());
                            } else {
                              learnController.resetLearning();
                              Get.offAll(Ending(indexTopic: indexTopic),
                                  transition: Transition.fadeIn);
                            }
                          }
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
          controller.rxIsCheckAnswerActive.value == true
              ? ShowAnswer(
                  result: controller.rxHintGameResult.value,
                  isVisibleMeaning: controller.rxIsVisibleMeaning.value,
                  word: controller.rxListWord[index].word,
                  phonetic: controller.rxListWord[index].phonetic,
                  pathAudio: controller.rxListWord[index].audioAsset,
                  vietnameseMeaning:
                      controller.rxListWord[index].vietnameseMeaning,
                  example: controller.rxListWord[index].example,
                  translateExample:
                      controller.rxListWord[index].translateExample)
              : Container(),
        ]),
      ),
    );
  }
}
