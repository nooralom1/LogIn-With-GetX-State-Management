import 'package:get/get.dart';
import 'package:login_with_getx/controller/api_controller/delete_from_cart.dart';
import 'package:login_with_getx/controller/api_controller/show_cart.dart';
import 'package:login_with_getx/model/show_cart.dart';

class ShowCartController extends GetxController{
  List<ProductCart>? productCart;
  RxBool isLoading = false.obs;
  RxInt counter = 1.obs;

  getShowCart()async{
    isLoading.value = true;
    productCart = await ShowCartService.showCartService();
    isLoading.value = false;
  }

  deleteFromCart({required int id})async{
    isLoading.value = true;
    bool status  = await DeleteFromCartService.cartService(id: id);
    isLoading.value = false;

    if(status){
      getShowCart();
    }

  }




  @override
  void onInit() {
    getShowCart();
    super.onInit();
  }
}