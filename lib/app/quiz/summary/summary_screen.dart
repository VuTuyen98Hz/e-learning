import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/main/quiz_controller.dart';
import 'package:learn_japanese/models/word_model.dart';
import '../../authentication/auth_controller.dart';
import '../../home/home.dart';
import 'circle_progress_bar.dart';

class SummaryScreen extends GetView<QuizController> {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    dynamic listQuizResult = Get.arguments;
    final size = MediaQuery.of(context).size;
    final List<WordModel> listTotal = listQuizResult[0];
    final List<WordModel> listTrueWord = listQuizResult[1];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Kết thúc Ôn Tập!",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
            const SizedBox(height: 40),
            SizedBox(
              width: 100,
              height: 100,
              child: Stack(fit: StackFit.expand, children: [
                CircleProgressBar(
                  stopValue: listTotal.isEmpty
                      ? 0.0
                      : listTrueWord.length / listTotal.length,
                ),
                Center(
                  child: Text(
                      "${controller.calculatePercent(listTrueWord.length, listTotal.length).toInt()}%",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20)),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            const Text("Bạn đã trả lời đúng: ",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
            Text("${listTrueWord.length} / ${listTotal.length}",
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              width: size.width * 0.9,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.yellow),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Scrollbar(
                child: ListView.builder(
                    padding: const EdgeInsetsDirectional.only(top: 5),
                    shrinkWrap: true,
                    itemCount: listTotal.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              wordIcon(listTrueWord, listTotal, index),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: size.width/3.8,
                                child: Text(listTotal[index].word,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              ),
                              const Text('(n)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17)),
                              SizedBox(width: size.width * 0.18),
                              SizedBox(
                                width: size.width/3.8,
                                child: Text(listTotal[index].vietnameseMeaning,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              ),
                            ]),
                      );
                    }),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                final user = AuthController.to;
                user.rxFireStoreUser.value!.listQuizWord =
                    controller.listQuizWordOriginal;
                user.updateBarChartData(listTrueWord.length, listTotal.length);
                Get.offAll(const HomeUI(),
                    arguments: 1, transition: Transition.fadeIn);
                controller.resetQuiz();
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(230, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                'VỀ MÀN HÌNH CHÍNH',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  Icon wordIcon(
      List<WordModel> listTrueWord, List<WordModel> listTotal, int index) {
    if (listTrueWord.contains(listTotal[index]) == true) {
      return const Icon(
        Icons.check_rounded,
        color: Colors.green,
        size: 20,
      );
    } else {
      return const Icon(
        Icons.close_rounded,
        color: Colors.red,
        size: 20,
      );
    }
  }
}
