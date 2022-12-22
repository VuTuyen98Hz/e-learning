import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main/quiz_controller.dart';

class SelectedWord2 extends GetView<QuizController> {
  const SelectedWord2({this.indexTopic = 0, super.key});

  final int indexTopic;

  @override
  Widget build(BuildContext context) {
    controller.initSelectedWord(indexTopic);
    // return listLessonStatus[widget.indexTopic].isFinishLesson == true
    return controller.listFinishedLesson.contains(indexTopic)
        ? Container(
            padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
            height: 550,
            child: Obx(
              () => ListView.builder(
                  itemCount: controller.rxCount.value,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.rxListCheckedWord[index] =
                            !controller.rxListCheckedWord[index];
                        controller.manageSelectedWord(index);
                      },
                      child: SizedBox(
                        height: 45,
                        child: Row(children: [
                          Checkbox(
                              value: controller.rxListCheckedWord[index],
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              shape: const CircleBorder(),
                              onChanged: (_) {
                                controller.rxListCheckedWord[index] =
                                    !controller.rxListCheckedWord[index];
                                controller.manageSelectedWord(index);
                              }),
                          Expanded(
                            child: Text(controller.listWord[index].word,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17)),
                          ),
                          const Expanded(
                            child: Text(' (n)',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17)),
                          ),
                          Expanded(
                            child: Text(
                                controller.listWord[index].vietnameseMeaning,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17)),
                          ),
                        ]),
                      ),
                    );
                  }),
            ),
          )
        : const Center(
            child: Text(
            "Bạn chưa hoàn thành bài học này!",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
          ));
  }
}
