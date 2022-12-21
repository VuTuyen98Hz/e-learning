import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'quiz_controller.dart';

class ProgressBarQuiz extends GetView<QuizController> {
  const ProgressBarQuiz({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() => Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            iconSize: 10,
                            icon: Image.asset("assets/icons/exit_icon.png"),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 300,
                                    color: Colors.white,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                30, 10, 30, 20),
                                            child: Text(
                                                'Bạn chắn chắn muốn thoát chứ?',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              QuizController.to.endQuiz();
                                              controller.resetQuiz();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                fixedSize: const Size(200, 60),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            child: const Text('THOÁT',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black)),
                                          ),
                                          const SizedBox(height: 30),
                                          ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(200, 60),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            child: const Text('Ở LẠI HỌC TIẾP',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                        SizedBox(
                          width: size.width * 0.83,
                          height: 30,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: LinearProgressIndicator(
                              value: QuizController.to.calculateProgressbar(),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.blue),
                              backgroundColor: const Color(0xffD6D6D6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(child: child),
                ]),
          ),
        ));
  }
}
