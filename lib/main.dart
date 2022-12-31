import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/authentication/auth_controller.dart';
import 'app/home/home_controller.dart';
import 'app/learning/main/learning_controller.dart';
import 'app/quiz/main/quiz_controller.dart';
import 'components/loading.dart';
import 'constants/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put<HomeController>(HomeController());
  Get.put<AuthController>(AuthController());
  Get.put<QuizController>(QuizController());
  Get.put<LearningController>(LearningController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Loading(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          getPages: AppRoutes.routes,
        ),
      );
  }
}
