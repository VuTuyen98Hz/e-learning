import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../animation/flip_animation.dart';
import '../../../animation/slide_animation.dart';
import '../../../helpers/show_example.dart';
import '../../../models/lesson_model.dart';
import '../listen_and_type/listen_and_type.dart';
import '../listen_and_type/listen_and_type_controller.dart';
import '../main/learning_controller.dart';
import '../main/progress_bar_learning.dart';
import 'flashcard_controller.dart';

class FlashCard extends GetView<FlashCardController> {
  FlashCard({this.index = 0, this.indexLesson = 0, Key? key}) : super(key: key);
  final animationController = FlipAnimationController();
  int index;
  final int indexLesson;
  final learnController = LearningController.to;

  @override
  Widget build(BuildContext context) {
    final visibleTextButton = learnController.didFinishedLesson(indexLesson);
    final size = MediaQuery.of(context).size;
    Get.put(LearningController());
    controller.rxListWord.value = listLessonModel[indexLesson].lesson;
    controller.rxIndex.value = index;
    return Obx(
      () => ProgressBarLearning(
        animationController: LearningController.to.animationController,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            SlideAnimation(
              child: GestureDetector(
                onTap: () async {
                  await animationController.flipWidget();
                  if (controller.rxFirstTap.value == false) {
                    controller.rxFirstTap.value = true;
                  }
                },
                child: FlipAnimation(
                  controller: animationController,
                  key: const ValueKey<int>(1),
                  front: Container(
                      width: size.width * 0.80,
                      height: size.height * 0.65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 30.0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            iconSize: 40,
                            icon: Image.asset(
                              "assets/icons/sound_icon.png",
                            ),
                            onPressed: () {
                              controller.audioPlayer.play(AssetSource(
                                  controller.rxListWord[index].audioAsset));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                            child: AspectRatio(
                                aspectRatio: 465 / 500,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      alignment: FractionalOffset.center,
                                      image: AssetImage(
                                          'assets/${controller.rxListWord[index].imageAsset}'),
                                    ),
                                  ),
                                )),
                          ),
                          Flexible(
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 40),
                              child: showExample(
                                  example: controller.rxListWord[index].example,
                                  highlightWord:
                                      controller.rxListWord[index].word),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image:
                                      AssetImage("assets/icons/tap_icon.png")),
                            ),
                          ),
                        ],
                      )),
                  back: Container(
                      width: size.width * 0.80,
                      height: size.height * 0.65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 30.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 40,
                            icon: Image.asset(
                              "assets/icons/sound_icon.png",
                            ),
                            onPressed: () {
                              controller.audioPlayer.play(AssetSource(
                                  controller.rxListWord[index].audioAsset));
                            },
                          ),
                          const SizedBox(height: 120),
                          Column(children: [
                            Text(
                              controller.rxListWord[index].word,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              controller.rxListWord[index].phonetic,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(controller.rxListWord[index].vietnameseMeaning,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20)),
                          ]),
                        ],
                      )),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 45, 0, 20),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: controller.rxFirstTap.value == true
                          ? () {
                              if (index < controller.rxListWord.length) {
                                Get.put(ListenAndTypeController());
                                Get.offAll(
                                    ListenAndType(
                                        index: index, indexLesson: indexLesson),
                                    transition: Transition.fadeIn);
                                controller.rxFirstTap.value = false;
                              } else {
                                Get.offAll(ListenAndType(index: index),
                                    transition: Transition.fadeIn);
                                Get.put(ListenAndTypeController());
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text(
                        'TIẾP TỤC',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    visibleTextButton == true
                        ? TextButton(
                            onPressed: controller.rxIsDelayTextButton.value ==
                                    true
                                ? null
                                : () => controller.skipWord(index, indexLesson),
                            child: const Text(
                              "Mình đã thuộc từ này!",
                              style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            ))
                        : const SizedBox(height: 40),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
