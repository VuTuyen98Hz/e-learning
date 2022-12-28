import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/home.dart';
import 'learning_controller.dart';

class ProgressBarLearning2 extends StatefulWidget {
  const ProgressBarLearning2(
      {Key? key, required this.child, required this.animationController})
      : super(key: key);
  final Widget child;
  final AnimationController animationController;

  @override
  State<ProgressBarLearning2> createState() => _ProgressBarLearning2State();
}

class _ProgressBarLearning2State extends State<ProgressBarLearning2>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> offsetAnimation;
  int valueTest = 0;

  @override
  void initState() {
    animationController = widget.animationController;

    animationController.addListener(() {
      if (!mounted) return;
      setState(() {
        double currentValue = animationController.value;
        if (currentValue > LearningController.to.rxProgressBarPoint / 10) {
          widget.animationController.stop();
        }
      });
    });

    offsetAnimation = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end: const Offset(7.18, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    super.initState();
  }

  // @override
  // void dispose() {
  //   widget.animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        iconSize: 10,
                        icon: Image.asset("assets/icons/exit_icon.png"),
                        onPressed: () {
                          showExitDialog(context);
                        }),
                    Stack(children: [
                      SizedBox(
                        width: size.width * 0.83,
                        height: 40.0,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: LinearProgressIndicator(
                            value: animationController.value,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                            backgroundColor: const Color(0xffD6D6D6),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0.0,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              // fit: BoxFit.fitHeight,
                              alignment: FractionalOffset.topCenter,
                              image: AssetImage("assets/icons/finish.png"),
                            ),
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: offsetAnimation,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              alignment: FractionalOffset.topCenter,
                              image: AssetImage("assets/icons/runner.png"),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Flexible(child: widget.child),
            ]),
      ),
    );
  }

  Future<void> showExitDialog(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
                  child: Text(
                      'Thoát bây giờ là toàn bộ kế quả học sẽ không được lưu lại. Bạn chắn chắn muốn thoát chứ?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                ),
                ElevatedButton(
                  onPressed: () {
                    LearningController.to.resetLearning();
                    Get.offAll(const HomeUI(),
                        arguments: 0, transition: Transition.fade);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(200, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('THOÁT',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('Ở LẠI HỌC TIẾP',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
