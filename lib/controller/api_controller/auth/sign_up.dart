import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:login_with_getx/controller/api_controller/apies.dart';

class SignUpService{

  static Future<bool> signUpService({required Map<String, dynamic> data})async {
    try {
      Uri url = Uri.parse(Apies.signUpUrl);
      var body = jsonEncode(data);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      var response = await http.post(url, body: body, headers: headers);
      if (response.statusCode == 201) {
        Get.snackbar("Message", "Registration Success");
        return true;
      } else if (response.statusCode == 422) {
        var responseData = jsonDecode(response.body)['errors'];
        List a = responseData.keys.toList();
        if (a.contains("email")) {
          Get.snackbar("Message", "This Email already used");
          return false;
        } else if (a.contains("phone")) {
          Get.snackbar("Message", "This Phone already used");
          return false;
        }
      }
    }catch (e) {
      log("Error: $e");
    }

    return false;
  }
}