
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/view/screen/auth/sign_in/sign_in.dart';



void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
