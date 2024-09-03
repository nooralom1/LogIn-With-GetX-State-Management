import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:login_with_getx/controller/local_storage/local_storage.dart';
import 'package:login_with_getx/model/show_cart.dart';

class ShowCartService {
  static Future<List<ProductCart>> showCartService() async {
    try {
      Uri url = Uri.parse("Apies.showCartsUrl");
      log("=======================");
      String token = await LocalStorage().readData(key: "token") ?? "";

      final header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      // 'Authorization': 'Bearer $token'
      var response = await http.get(url, headers: header);
      log("===========sss============");

      log("${response.statusCode}");
      log("${response.body}");
      if (response.statusCode == 200) {
        ShowCartModel data = ShowCartModel.fromJson(jsonDecode(response.body));
        return data.productCart ?? [];
      }
    } catch (e) {
      log("Error: $e");
    }
    return [];
  }
}
