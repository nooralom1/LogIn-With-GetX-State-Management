import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:login_with_getx/controller/api_controller/apies.dart';
import 'package:login_with_getx/model/show_cart.dart';

class ShowCartService {
  static Future<List<ProductCart>> showCartService()async{
    try{
      Uri url = Uri.parse(Apies.showCartsUrl);
      var response = await http.get(url);
      if(response.statusCode==200){
        ShowCartModel data = ShowCartModel.fromJson(jsonDecode(response.body));
        return data.productCart??[];
      }
    }catch(e){
      log("Error: $e");
    }
    return [];
  }
}
