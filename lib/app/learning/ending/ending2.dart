import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/global_screen/select_word/select_word.dart';
import '../../../models/word_model.dart';
import '../../authentication/auth_controller.dart';
import '../../home/home.dart';
import 'ending_controller.dart';

class Ending2 extends GetView<EndingController> {
  const Ending2({this.indexTopic = 0, super.key});
  final int indexTopic;

  @override
  Widget build(BuildContext context) {
    Get.put(EndingController());
    controller.rxListWord.value = listLesson[indexTopic].listWord;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text("Chọn từ vựng mà bạn muốn ôn tập",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              SelectWord(indexTopic: indexTopic),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(const HomeUI(), transition: Transition.fadeIn);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child:
                const Text('ÔN TẬP NGAY', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    AuthController.to.updateUserFireStore();
                    Get.offAll(const HomeUI());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(270, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    'HỌC TỪ MỚI',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
