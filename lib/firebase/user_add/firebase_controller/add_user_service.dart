


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserFirebaseService{

  static Future<bool> addUserService({required String name, required String phone})async{
    try{
       var data = {
         "name" : name,
         "phone" : phone
       };

      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      // await firebaseFirestore.collection("user").add(data);
       var d = DateTime.now();
       await firebaseFirestore.collection("new_user").add(data);
      // await firebaseFirestore.collection("user").doc(d.toString().substring(0,11)).collection("aa").add(data);
      return true;
    }catch (e){
      log("Error : $e");
    }
    return false;
  }
}