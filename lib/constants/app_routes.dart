import 'package:get/get.dart';
import '../app/authentication/profile_screen.dart';
import '../app/authentication/signin_screen.dart';
import '../app/authentication/signup_screen.dart';
import '../components/splash_ui.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const SplashUI()),
    GetPage(name: '/signin', page: () => SignInScreen()),
    GetPage(name: '/signup', page: () => SignUpScreen()),
    GetPage(name: '/home', page: () => const ProfileScreen()),
  ];
}
