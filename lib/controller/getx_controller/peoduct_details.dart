import 'package:get/get.dart';
import 'package:login_with_getx/controller/api_controller/product_details.dart';
import 'package:login_with_getx/model/product_details.dart';

class ProductDetailsController extends GetxController{
  ProductDetails? productDetails;
  RxBool isLoading = false.obs;
  RxList<dynamic> image = [].obs;

  getProductDetails()async{
    isLoading.value=true;
    productDetails = await ProductDetailsService.productDetailsService();
    image(productDetails?.images);
    isLoading.value=false;
  }
  @override
  void onInit() {
    getProductDetails();
    super.onInit();
  }
}