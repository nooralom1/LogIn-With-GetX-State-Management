import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:login_with_getx/controller/api_controller/apies/apies.dart';
import 'package:login_with_getx/model/product_details.dart';

class ProductDetailsService{
  static Future<ProductDetails?> productDetailsService({required int id})async{
    try{
      Uri url = Uri.parse("${Apies.productsDetailsUrl}/$id");
      var response = await http.get(url);
      if(response.statusCode==200){
        ProductsDetailsModel data = ProductsDetailsModel.fromJson(jsonDecode(response.body));
        return data.productDetails;
      }
    }catch(e){
      log("Error: $e");
    }
    return null;
  }
}