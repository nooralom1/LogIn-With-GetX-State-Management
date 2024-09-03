import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_with_getx/controller/local_storage/local_storage.dart';

class SignInService {
  static Future<bool> signInService(
      {required Map<String, dynamic> data}) async {
    try {
      Uri url = Uri.parse("Apies.signInUrl");
      var body = jsonEncode(data);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      var response = await http.post(url, body: body, headers: headers);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        Get.snackbar("Message", "Login successfully  !!");
        log("---------------- ${responseData['token']}");
        await LocalStorage()
            .writeData(key: "token", value: responseData['token']);
        // await LocalStorage().writeData(key: "userInfo", value: jsonEncode(responseData['response_data']));
        return true;
      } else if (response.statusCode == 401) {
        Get.snackbar("Message", "Wrong user");
      }
    } catch (e) {
      log("Error :$e");
    }
    return false;
  }
}
