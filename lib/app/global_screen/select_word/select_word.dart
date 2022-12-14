import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/word_model.dart';
import 'selected_word_controller.dart';

class SelectWord extends GetView<SelectedController> {
  SelectWord({this.indexTopic = 0, super.key});
  final int indexTopic;

  @override
  Widget build(BuildContext context) {
    Get.put(SelectedController());
    controller.rxListWord.value = listLesson[indexTopic].listWord;
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
      height: 550,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectWord(index);
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
                          controller.selectWord(index);
                        }),
                    Expanded(
                      child: Text(controller.rxListWord[index].word,
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
                          controller.rxListWord[index].vietnameseMeaning,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                    ),
                  ]),
                ),
              ),
            );
          }),
    );
  }
}
