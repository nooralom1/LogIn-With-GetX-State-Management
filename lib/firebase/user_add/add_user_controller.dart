import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/firebase/user_add/firebase_controller/add_user_service.dart';
import 'package:login_with_getx/firebase/user_add/firebase_controller/get_all_user_service.dart';

class AddUserController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool isLoading = false.obs;
  RxList<Map<String, dynamic>> userList = <Map<String, dynamic>>[].obs;

  addUserFun() async {
    log("=========== Call ====================");
    isLoading.value = true;
    bool status = await AddUserFirebaseService.addUserService(
        name: nameController.text, phone: phoneController.text);
    isLoading.value = false;

    if (status) {
      nameController.clear();
      phoneController.clear();
    }
    log("============= End ==================");
  }

  getAllUser() async {
    QuerySnapshot<Map<String, dynamic>>? data =
        await GetAllUserFirebaseService.getUserService();

    if (data != null) {
      userList.clear();
      log("========== Length : ${data.docs.length} ============");
      for (var i in data.docs.toList()) {
        log("========== a : ${i["name"]} ============");
        log("========== a : ${i["phone"]} ============");
        var returnData = {"name": i['name'], "phone": i['phone']};
        userList.add(returnData);
      }
    }
    return data;
  }

  @override
  void onInit() {
    getAllUser();
    super.onInit();
  }
}
