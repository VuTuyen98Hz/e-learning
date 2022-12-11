import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/home.dart';
import 'ending_controller.dart';

class SelectWord extends GetView<EndingController> {
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
              Container(
                padding: const EdgeInsets.all(35),
                height: 300,
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Example',
                                style: (TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                            const Text('(n)',
                                style: (TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                            const Text('Ví dụ Ví dụ Ví dụ Ví dụ',
                                style: (TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                          ]);
                    }),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(const HomeUI(),
                      transition: Transition.fadeIn);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child:
                    const Text('ÔN TẬP NGAY', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
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
