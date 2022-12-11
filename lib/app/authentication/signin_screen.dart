import 'package:flutter/material.dart';
import 'dart:core';
import 'package:get/get.dart';
import 'package:learn_japanese/app/authentication/signup_screen.dart';
import 'package:learn_japanese/helpers/helpers.dart';

import '../../components/form_input_field_with_icon.dart';
import '../../components/label_button.dart';
import '../../components/sign_in_button.dart';
import 'auth_controller.dart';


class SignInScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 60.0),
                        FormInputFieldWithIcon(
                          controller: authController.emailController,
                          iconPrefix: Icons.email,
                          hintText: 'Email',
                          validator: Validator().email,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => null,
                          onSaved: (value) =>
                              authController.emailController.text = value!,
                          obscureText: false,
                        ),
                        const SizedBox(height: 24),
                        FormInputFieldWithIcon(
                          controller: authController.passwordController,
                          iconPrefix: Icons.lock,
                          iconSuffix: InkWell(
                            child: Icon(authController.obscurePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onTap: () {
                              authController.obscurePassword.value =
                                  !authController.obscurePassword.value;
                            },
                          ),
                          hintText: 'Password',
                          validator: Validator().password,
                          onChanged: (value) => null,
                          onSaved: (value) =>
                              authController.passwordController.text = value!,
                          maxLines: 1,
                          obscureText: authController.obscurePassword.value,
                        ),
                        const SizedBox(height: 50),
                        SignInButton(
                            labelText: 'Đăng nhập',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                authController
                                    .signInWithEmailAndPassword(context);
                              }
                            }),
                        const SizedBox(height: 30),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Chưa có tài khoản? ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              LabelButton(
                                labelText: 'Tạo tài khoản mới',
                                onPressed: () => Get.to(SignUpScreen(),
                                    transition: Transition.fade),
                              )
                            ]),
                        const Text(
                          'Đăng nhập bằng tài khoản khác',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _facebookIconButton(),
                            const SizedBox(width: 20),
                            _googleIconButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _facebookIconButton() {
    return IconButton(
      iconSize: 40,
      icon: Image.asset(
        "assets/icons/facebook_icon.png",
      ),
      onPressed: () {
        return authController.loginWithFacebook();
      },
    );
  }

  Widget _googleIconButton() {
    return IconButton(
      iconSize: 40,
      icon: Image.asset(
        "assets/icons/google_icon.png",
      ),
      onPressed: () {
        authController.loginWithGoogle();
      },
    );
  }
}
