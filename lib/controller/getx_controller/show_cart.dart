import 'package:get/get.dart';
import 'package:login_with_getx/controller/api_controller/show_cart.dart';
import 'package:login_with_getx/model/show_cart.dart';

class ShowCartController extends GetxController{
  List<ProductCart>? productCart;
  RxBool isLoading = false.obs;

  getShowCart()async{
    isLoading.value = true;
    productCart = await ShowCartService.showCartService();
    isLoading.value = false;
  }

  @override
  void onInit() {
    getShowCart();
    super.onInit();
  }
}