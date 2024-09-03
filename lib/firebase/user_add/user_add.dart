import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/firebase/user_add/add_user_controller.dart';
import 'package:login_with_getx/firebase/user_add/firebase_controller/get_all_user_service.dart';
import 'package:login_with_getx/firebase/user_add/widget/common_text_field.dart';
import 'package:login_with_getx/view/common_widgets/common_button.dart';
import 'package:login_with_getx/view/common_widgets/common_loading_button.dart';

class UserAdd extends StatelessWidget {
  const UserAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddUserController controller = Get.put(AddUserController());
    return Scaffold(
      appBar: AppBar(
        title: Text("User Add"),
      ),
      body: Center(
        child: Column(
          children: [
            CommonTextField(controller: controller.nameController),
            SizedBox(height: 10),
            CommonTextField(controller: controller.phoneController),
            SizedBox(height: 10),
            Obx(() => controller.isLoading.isTrue
                ? CommonLoadingButton()
                : CommonButton(
                    buttonName: "Add User",
                    onTap: () {
                      controller.addUserFun();
                    })),
            SizedBox(height: 100),
            CommonButton(
                buttonName: "Get User",
                onTap: () {
                  controller.getAllUser();
                }),


           Obx(()=>  Expanded(
             child: ListView.builder(
                 shrinkWrap: true,
                 itemCount: controller.userList.length,
                 itemBuilder: (context, index) {
                   return ListTile(
                     title: Text("${controller.userList[index]['name']}"),
                     subtitle: Text("${controller.userList[index]['phone']}"),
                   );
                 }),
           )),

            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("new_user").snapshots(),
                builder: (context, s){
                  if(s.hasError){
                    return Text("Error");
                  }else if(s.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }else if(s.hasData){
                    return  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: s.data?.docs.length ?? 0,
                          itemBuilder: (context, index) {
                            log("===== ${s.data?.docs[index].data()['phone']}");
                            return ListTile(
                              title: Text("===== ${s.data?.docs[index].data()['name']}"),
                              subtitle: Text("===== ${s.data?.docs[index].data()['phone']}"),
                            );
                          }),
                    );
                  }
                  return Text("data");
                }
            )


          ],
        ),
      ),
    );
  }
}
