import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../authentication/auth_controller.dart';
import '../../quiz/notebook/selected_word.dart';
import '../../home/home.dart';
class Ending2 extends StatelessWidget {
  const Ending2({this.indexTopic = 0, super.key});

  final int indexTopic;

  @override
  Widget build(BuildContext context) {
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
              SelectedWord(indexTopic: indexTopic),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    AuthController.to.updateUserFireStore();
                    Get.offAll(const HomeUI(),
                        arguments: 0, transition: Transition.fadeIn);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(270, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    'VỀ MÀN HÌNH CHÍNH',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
