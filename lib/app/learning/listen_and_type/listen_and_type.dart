import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/learning/main/learning_controller.dart';
import 'package:learn_japanese/app/learning/main/progress_bar_learning.dart';
import 'package:learn_japanese/app/learning/type_with_hint/type_with_hint.dart';
import 'package:learn_japanese/components/show_answer.dart';
import '../../../models/word_model.dart';
import '../ending/ending.dart';
import '../ending/ending_controller.dart';
import '../type_with_hint/type_with_hint_controller.dart';
import 'listen_and_type_controller.dart';

class ListenAndType extends GetView<ListenAndTypeController> {
  ListenAndType({this.index = 0, this.indexTopic = 0, Key? key})
      : super(key: key);
  final LearningController learnController = LearningController.to;
  final int indexTopic;
  int index;

  @override
  Widget build(BuildContext context) {
    controller.rxListWord.value = listLesson[indexTopic].listWord;
    controller.rxIndex.value = index;
    return ProgressBarLearning(
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
                      controller.audioPlayer.play(
                          AssetSource(controller.rxListWord[index].audioAsset));
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
                    enabled:
                        controller.rxChangeButton.value == false ? true : false,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.rxCheckButton.value = true;
                        if (value.toLowerCase().trim() ==
                            controller.rxListWord[index].word) {
                          controller.rxListenResult.value = true;
                        } else {
                          controller.rxListenResult.value = false;
                        }
                      } else {
                        controller.rxCheckButton.value = false;
                      }
                    },
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
                    controller.rxChangeButton.value == false
                        ? ElevatedButton(
                            onPressed: controller.rxCheckButton.value == true
                                ? () {
                                    controller.rxIsCheckAnswerActive.value =
                                        true;
                                    controller.rxChangeButton.value = true;
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    // run round two
                                    if (learnController.rxIsEndRoundOne.value ==
                                        true) {
                                      learnController.checkResulRoundTwo(
                                          controller.rxListenResult.value,
                                          index);
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
                        : ElevatedButton(
                            onPressed: () {
                              //run round one
                              if (index < controller.rxListWord.length &&
                                  learnController.rxIsEndRoundOne.value ==
                                      false) {
                                Get.offAll(TypeWithHint(
                                    listenGameResult:
                                        controller.rxListenResult.value,
                                    index: index,
                                    indexTopic: indexTopic));
                                Get.put(TypeWithHintController());
                              } else {
                                //reset ListWordRoundTwo
                                debugPrint('Hello listen before $index');
                                if (index + 1 >=
                                    learnController.rxListWordRoundTwo.length) {
                                  index = 0;
                                  debugPrint('Hello listen $index');
                                } else {
                                  index += 1;
                                  debugPrint('Hello listen $index');
                                }
                                // run round two
                                if (learnController
                                    .rxListWordRoundTwo.isNotEmpty) {
                                  Get.offAll(
                                      TypeWithHint(
                                        index: learnController
                                            .rxListWordRoundTwo[index],
                                        indexTopic: indexTopic,
                                      ),
                                      transition: Transition.fadeIn);
                                  Get.put(TypeWithHintController());
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
              ? ShowAnswer(
                  answer: controller.rxListenResult.value,
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
