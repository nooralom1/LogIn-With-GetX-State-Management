
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/controller/api_controller/sign_in_service.dart';
import 'package:login_with_getx/view/screen/home/home.dart';


class SignInController extends GetxController{
  final formKey = GlobalKey<FormState>();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;


  signInFun()async{
    isLoading.value = true;
    bool status = await SignInService.signIn();
    isLoading.value = false;

    if(status){
      log("Next Page");
      Get.to(()=> const Home());
      return;
    }


  }

}