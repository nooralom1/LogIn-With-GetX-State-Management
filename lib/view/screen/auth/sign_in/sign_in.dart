import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/controller/getx_controller/auth/sign_in.dart';
import 'package:login_with_getx/view/common_widgets/common_button.dart';
import 'package:login_with_getx/view/common_widgets/common_loading_button.dart';
import 'package:login_with_getx/view/screen/auth/sign_in/widget/email_text_field.dart';
import 'package:login_with_getx/view/screen/auth/sign_in/widget/password_text_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.put(SignInController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: signInController.formKey,
                child: Column(
                  children: [
                    SizedBox(child: Image.asset("assets/image/288694.png")),
                    const SizedBox(
                      height: 50,
                    ),
                    EmailTextField(
                      mailController: signInController.mailController,
                    ),
                    buildSizedBox(height: 10),
                    PasswordTextField(
                      passController: signInController.passwordController,
                    ),
                    buildSizedBox(height: 10),

                    Obx(() => signInController.isLoading.isFalse
                        ? CommonButton(
                            buttonName: "Sign In",
                            onTap: () {
                              if (!signInController.formKey.currentState!
                                  .validate()) {
                                return;
                              }
                              log("==========222222222222===============");
                              signInController.signInFun();
                            })
                        : const CommonLoadingButton()),
                    //
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) =>
      SizedBox(height: height, width: width);
}
