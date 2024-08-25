import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/controller/getx_controller/auth/sign_up.dart';
import 'package:login_with_getx/view/common_widgets/common_button.dart';
import 'package:login_with_getx/view/common_widgets/common_loading_button.dart';
import 'package:login_with_getx/view/common_widgets/common_text.dart';
import 'package:login_with_getx/view/screen/auth/sign_in/sign_in.dart';
import 'package:login_with_getx/view/screen/auth/sign_in/widget/email_text_field.dart';
import 'package:login_with_getx/view/screen/auth/sign_in/widget/password_text_field.dart';
import 'package:login_with_getx/view/screen/auth/sign_up/widget/confirm_password_text_field.dart';
import 'package:login_with_getx/view/screen/auth/sign_up/widget/phone_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailTextField(mailController: controller.emailController),
              SizedBox(
                height: 15,
              ),
              PhoneTextField(passController: controller.phoneController),
              SizedBox(
                height: 15,
              ),
              PasswordTextField(passController: controller.passController),
              SizedBox(
                height: 15,
              ),
              ConfirmPasswordTextField(passController: controller.confirmPassController),
              SizedBox(
                height: 15,
              ),
              Obx(() => controller.isLoading.isFalse
                  ? CommonButton(
                  buttonName: "Sign Up",
                  onTap: () {
                    if (!controller.formKey.currentState!
                        .validate()) {
                      return;
                    }
                    controller.sinInFun();
                  })
                  : const CommonLoadingButton()),
              SizedBox(height: 30,),
              CommonButton(buttonName: "Already have account Sign in", onTap: (){
                Get.to(()=>SignIn());
              })
            ],
          ),
        ),
      ),
    );
  }
}
