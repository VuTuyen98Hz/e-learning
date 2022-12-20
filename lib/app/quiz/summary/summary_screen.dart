import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/app/quiz/main/quiz_controller.dart';
import 'package:learn_japanese/models/word_model.dart';
import '../../home/home.dart';

class SummaryScreen extends GetView<QuizController> {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    dynamic listQuizResult = Get.arguments;
    final List<WordModel> listTotal = listQuizResult[0];
    final List<WordModel> listTrueWord = listQuizResult[1];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hoàn Thành Ôn Tập!",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
            const SizedBox(height: 40),
            SizedBox(
              width: 100,
              height: 100,
              child: Stack(fit: StackFit.expand, children: [
                CircularProgressIndicator(
                  value: listTotal.isEmpty
                      ? 0
                      : (listTrueWord.length / listTotal.length),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  backgroundColor: const Color(0xffD6D6D6),
                  strokeWidth: 20,
                ),
                Center(
                  child: Text(
                      "${controller.totalCorrect(listTrueWord, listTotal).toInt()}%",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20)),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            const Text("Số câu không sai lần nào: ",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
            Text("${listTrueWord.length} / ${listTotal.length}",
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              width: 350,
              height: 280,
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.yellow),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Scrollbar(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listTotal.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 30,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wordIcon(listTrueWord, listTotal, index),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(listTotal[index].word,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              ),
                              const Expanded(
                                child: Text('(n)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              ),
                              Expanded(
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
                controller.resultQuiz = controller.totalCorrect(listTrueWord, listTotal);
                // controller.setSummaryPoints(controller.resultQuiz);
                controller
                    .setBarChartPoints(controller.totalCorrect(listTrueWord, listTotal));
                controller.totalResult =
                    "${listTrueWord.length}/${listTotal.length}";
                Get.offAll(const HomeUI(),
                    arguments: 1, transition: Transition.fadeIn);
                controller.resetToZero();
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
