// matching various patterns for kinds of data
import 'package:get/get.dart';

class Validator {
  Validator();

  String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Định dạng Email không đúng rồi!';
    } else {
      return null;
    }
  }

  String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Mật khẩu phải có ít nhất 6 ký tự nhé!';
    } else {
      return null;
    }
  }

  String? name(String? value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Bạn không được để trống nên nhé!';
    } else {
      return null;
    }
  }

  // String? notEmpty(String? value) {
  //   String pattern = r'^\S+$';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value!)) {
  //     return 'validator.notEmpty'.tr;
  //   } else {
  //     return null;
  //   }
  // }
}
