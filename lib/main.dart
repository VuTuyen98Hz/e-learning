import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learn_japanese/constants/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/authentication/auth_controller.dart';
import 'components/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put<AuthController>(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
