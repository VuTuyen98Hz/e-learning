import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learn_japanese/helpers/helpers.dart';

import '../../components/form_input_field_with_icon.dart';
import '../../components/label_button.dart';
import '../../components/sign_in_button.dart';
import 'auth_controller.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
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
                        controller: authController.nameController,
                        iconPrefix: Icons.person,
                        hintText: 'Username',
                        validator: Validator().name,
                        onChanged: (value) {},
                        onSaved: (value) =>
                            authController.nameController.text = value!,
                        obscureText: false,
                      ),
                      const SizedBox(height: 24),
                      FormInputFieldWithIcon(
                        controller: authController.emailController,
                        iconPrefix: Icons.email,
                        hintText: 'Email',
                        validator: Validator().email,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value){},
                        onSaved: (value) =>
                            authController.emailController.text = value!,
                        obscureText: false,
                      ),
                      const SizedBox(height: 24),
                      FormInputFieldWithIcon(
                        controller: authController.passwordController,
                        iconPrefix: Icons.lock,
                        iconSuffix: authController.visiblePassword(),
                        hintText: 'Password',
                        validator: Validator().password,
                        onChanged: (value) {},
                        onSaved: (value) =>
                            authController.passwordController.text = value!,
                        maxLines: 1,
                        obscureText: authController.obscurePassword.value,
                      ),
                      const SizedBox(height: 24),
                      SignInButton(
                          labelText: 'Đăng ký',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              SystemChannels.textInput.invokeMethod(
                                  'TextInput.hide'); //to hide the keyboard - if any
                              authController
                                  .registerWithEmailAndPassword(context);
                            }
                          }),
                      const SizedBox(height: 24),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Đã có tài khoản? ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                            LabelButton(
                              labelText: 'Đăng nhập',
                              onPressed: () => Get.to(SignInScreen(),
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
                      ///
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
      ),
    );
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
        return authController.loginWithGoogle();
      },
    );
  }
}
