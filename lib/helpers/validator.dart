import 'package:learn_japanese/app/authentication/auth.dart';

class Validator {
  Validator();

  String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Bạn không được để trống trường này nhé!';
    } else if (!regex.hasMatch(value)) {
      return 'Định dạng Email không đúng rồi!';
    } else {
      return null;
    }
  }

  String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Bạn không được để trống trường này nhé!';
    } else if (!regex.hasMatch(value)) {
      return 'Mật khẩu phải có ít nhất 6 ký tự nhé!';
    } else {
      return null;
    }
  }

  String? rePassword(String? value) {
    if (value!.isEmpty) {
      return 'Bạn không được để trống trường này nhé!';
    } else if (value != AuthController.to.passwordController.text) {
      return 'Mật khẩu trùng khớp!';
    } else {
      return null;
    }
  }

  String? name(String? value) {
    String pattern = r'^.{3,}$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Bạn không được để trống trường này nhé!';
    } else if (!regex.hasMatch(value)) {
      return 'Tên hiển thị phải có ít nhất 3 ký tự nhé!';
    } else {
      return null;
    }
  }

// String? name(String? value) {
//   String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
//   RegExp regex = RegExp(pattern);
//   if (!regex.hasMatch(value!)) {
//     return 'Tên hiển thị không được để trống';
//   } else {
//     return null;
//   }
// }
//
}
