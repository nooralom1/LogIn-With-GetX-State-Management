import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:login_with_getx/controller/api_controller/apies/apies.dart';
import 'package:login_with_getx/model/products.dart';

class ProductsService{

  static Future<List<Products>> productsService()async{
    try{
      Uri url = Uri.parse(Apies.productsUrl);
      var response = await http.get(url);
      if(response.statusCode==200){
        ProductsModel data = ProductsModel.fromJson(jsonDecode(response.body));
        return data.products??[];
      }
    }catch(e){
      log("Error: $e");
    }
    return [];
  }
}