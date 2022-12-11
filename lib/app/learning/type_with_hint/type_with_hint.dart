import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/learning/flashcard/flashcard.dart';
import 'package:learn_japanese/app/learning/listen_and_type/listen_and_type.dart';
import 'package:learn_japanese/app/learning/main/progress_bar_learning.dart';
import 'package:learn_japanese/app/learning/type_with_hint/text_form_field_fill_word.dart';
import 'package:learn_japanese/app/learning/type_with_hint/type_with_hint_controller.dart';
import '../../../animation/slide_animation.dart';
import '../../../models/word_model.dart';
import '../ending/ending_controller.dart';
import '../flashcard/flashcard_controller.dart';
import '../listen_and_type/listen_and_type_controller.dart';
import '../main/learning_controller.dart';
import '../ending/ending.dart';

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
    controller.rxListWord.value = listLesson[indexTopic].listWord;
    return ProgressBarLearning(
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
                    SizedBox(height: 20),
                    Text(controller.rxListWord[index].vietnameseMeaning,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 25)),
                    SizedBox(height: 40),
                    TextFormFieldFillWord(
                      appContext: context,
                      length: controller.rxListWord[index].word.length,
                      onChanged: (value) {
                        if (value.length ==
                            controller.rxListWord[index].word.length) {
                          controller.rxCheckButton.value = true;
                          if (value.toLowerCase().trim() ==
                              controller.rxListWord[index].word) {
                            controller.hintGameResult.value = true;
                          } else {
                            controller.hintGameResult.value = false;
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
                                    controller.hintGameResult.value,
                                    index);
                                // run round two
                                if (learnController.rxIsEndRoundOne.value ==
                                    true) {
                                  learnController.checkResulRoundTwo(
                                      controller.hintGameResult.value, index);
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
                              debugPrint('Hello hint $index');
                            } else {
                              index += 1;
                              debugPrint('Hello hint $index');
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
                              Get.put(EndingController());
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
              ? showAnswer(controller.hintGameResult.value, context)
              : Container(),
        ]),
      ),
    );
  }

  Widget showAnswer(bool value, context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.30,
      alignment: Alignment.center,
      color: value == true ? Colors.green : Colors.red,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 10, 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.rxListWord[index].word,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.rxListWord.first.phonetic,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(controller.rxListWord[index].vietnameseMeaning,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.rxListWord[index].example,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: controller.isVisibleMeaning.value,
                  child: Text(controller.rxListWord[index].translateExample,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20)),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Icon(
                  Icons.volume_down_alt,
                  color: Colors.yellow,
                  size: 20.0,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.isVisibleMeaning.value =
                      !controller.isVisibleMeaning.value;
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Icon(
                  Icons.visibility,
                  color: Colors.yellow,
                  size: 20.0,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
