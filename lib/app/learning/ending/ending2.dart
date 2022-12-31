import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/auth_controller.dart';
import '../../home/home.dart';
import '../../quiz/notebook/selected_word2.dart';

class Ending2 extends StatefulWidget {
  const Ending2({this.indexLesson = 0, super.key});

  final int indexLesson;

  @override
  State<Ending2> createState() => _Ending2State();
}

class _Ending2State extends State<Ending2> {
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
              SelectedWord2(indexLesson: widget.indexLesson),
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
