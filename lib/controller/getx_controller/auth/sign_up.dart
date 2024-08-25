import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/controller/api_controller/auth/sign_up.dart';
import 'package:login_with_getx/view/screen/auth/sign_in/sign_in.dart';

class SignUpController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  sinInFun()async{

    Map<String, dynamic> data = {
      "email": emailController.text,
      "phone": phoneController.text,
      "password": passController.text,
      "password_confirmation": confirmPassController.text,
    };
    isLoading.value=true;
    bool status = await SignUpService.signUpService(data: data);
    isLoading.value=false;
    if(status){
      log("Next Page");
      Get.to(()=>const SignIn());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}