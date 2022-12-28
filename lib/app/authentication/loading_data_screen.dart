import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../authentication/auth_controller.dart';

class LoadingDataScreen extends GetView<AuthController> {
  const LoadingDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Đang tải dữ liệu...',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
