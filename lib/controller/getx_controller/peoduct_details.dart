import 'dart:developer';

import 'package:get/get.dart';
import 'package:login_with_getx/controller/api_controller/add_to_cart.dart';
import 'package:login_with_getx/controller/api_controller/product_details.dart';
import 'package:login_with_getx/model/product_details.dart';

class ProductDetailsController extends GetxController{
  ProductDetails? productDetails;
  RxBool isLoading = false.obs;
  RxList<dynamic> image = [].obs;

  getProductDetails()async{
    isLoading.value=true;
    var data  = await Get.arguments ?? 0;
    productDetails = await ProductDetailsService.productDetailsService(id: data);
    image(productDetails?.images);
    isLoading.value=false;
  }

  addToCartFunction({required int  id})async{
   bool status = await AddToCartService.cartService(id: id);
   log("============ AA : $status");

   if(status == true){

      Get.back();
   }
  }


  @override
  void onInit() {
    getProductDetails();
    super.onInit();
  }
}