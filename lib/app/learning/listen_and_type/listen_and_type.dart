import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/learning/main/learning_controller.dart';
import 'package:learn_japanese/helpers/show_answer.dart';
import '../../../models/lesson_model.dart';
import '../main/progress_bar_learning.dart';
import 'listen_and_type_controller.dart';

class ListenAndType extends GetView<ListenAndTypeController> {
  ListenAndType({this.index = 0, this.indexLesson = 0, Key? key})
      : super(key: key);

  final int indexLesson;
  int index;

  @override
  Widget build(BuildContext context) {
    Get.put(ListenAndTypeController());
    controller.rxListWord.value = listLessonModel[indexLesson].lesson;
    controller.rxIndex.value = index;
    return ProgressBarLearning(
      animationController: LearningController.to.animationController,
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
                      controller.onChangedTextFormField(value, index);
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
                                ? () => controller.onCheck(index)
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
                              controller.onContinue(index, indexLesson);
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
                  result: controller.rxListenResult.value,
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
