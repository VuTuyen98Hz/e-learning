import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/main/progress_bar_quiz.dart';
import '../../../animation/slide_animation.dart';
import '../../../helpers/show_example.dart';
import '../main/quiz_controller.dart';
import 'multiple_choice_controller.dart';

class MultipleChoice extends GetView<MultipleChoiceController> {
  MultipleChoice({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    Get.put(MultipleChoiceController());
    final size = MediaQuery.of(context).size;
    return ProgressBarQuiz(
      child: Obx(
        () => SlideAnimation(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Chọn nghĩa cho từ được gạch chân ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Flexible(
                    child: Container(
                      width: size.width * 0.85,
                      height: size.width * 0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green, width: 2),
                          shape: BoxShape.rectangle),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: showExample(
                          example:
                              "I don't think this classroom have enough chair",
                          highlightWord: "chair"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Option(thisOption: 1, textOption: "Nghĩa tiếng việt 1"),
                  Option(thisOption: 2, textOption: "Nghĩa tiếng việt 2"),
                  Option(thisOption: 3, textOption: "Nghĩa tiếng việt 3"),
                  const SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 40),
                    child: controller.rxChangeButton.value == false
                        ? ElevatedButton(
                            onPressed: controller.currentOption.value != 0
                                ? () {
                                    if (controller.currentOption.value !=
                                        controller.rxRightOption.value) {
                                      controller.rxAnswerColor.value = false;
                                    } else {}
                                    controller.rxChangeButton.value = true;
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(300, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Text(
                              'TIẾP TỤC',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Option({required thisOption, required String textOption}) {
    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: GestureDetector(
          onTap: controller.rxChangeButton.value == false
              ? () {
                  controller.currentOption.value = thisOption;
                }
              : null,
          child: Container(
            alignment: Alignment.center,
            width: 330,
            height: 65,
            margin: const EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: optionBorderColor(
                      controller.currentOption.value, thisOption),
                  width: 3),
              borderRadius: BorderRadius.circular(25.0),
              color: answerBackgroundColor(
                  controller.currentOption.value, thisOption),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Text(textOption,
                style: TextStyle(
                    color: answerTextColor(
                        controller.currentOption.value, thisOption),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }

  Color answerTextColor(int currentOption, int thisOption) {
    if (controller.rxChangeButton.value == true &&
        thisOption == controller.rxRightOption.value) {
      return Colors.white;
    }
    if (controller.rxAnswerColor.value == false &&
        currentOption == thisOption) {
      return Colors.white;
    }
    return Colors.black;
  }

  Color answerBackgroundColor(int currentOption, int thisOption) {
    if (controller.rxChangeButton.value == true &&
        thisOption == controller.rxRightOption.value) {
      return Colors.green;
    } else if (controller.rxAnswerColor.value == false &&
        currentOption == thisOption) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  Color optionBorderColor(int currentOption, int thisOption) {
    if (controller.rxChangeButton.value == false &&
        currentOption == thisOption) {
      return Colors.yellow;
    } else if (controller.rxChangeButton.value == true &&
        thisOption == controller.rxRightOption.value) {
      return Colors.green;
    } else if (controller.rxAnswerColor.value == false &&
        currentOption == thisOption) {
      return Colors.red;
    }
    return Colors.white;
  }
}
