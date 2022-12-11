import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/learning/main/learning_controller.dart';
import '../../home/home.dart';

class ProgressBarLearning extends GetView<LearningController> {
  ProgressBarLearning({
    Key? key,
    required this.child,
  }) : super(key: key);
  final LearningController learnController = LearningController.to;
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
                                              'Thoát bây giờ là toàn bộ kế quả học sẽ không được lưu lại. Bạn chắn chắn muốn thoát chứ?',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            learnController.resetLearning();
                                            Get.offAll(const HomeUI(),
                                                transition: Transition.fade);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              fixedSize: const Size(200, 60),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          child: const Text('Chắc chắn rồi!',
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
                                          child: const Text('Ở lại học tiếp',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(
                          width: size.width * 0.83,
                          height: 30,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: LinearProgressIndicator(
                              value: learnController.rxProgressBarPoint.value *
                                  0.1,
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
