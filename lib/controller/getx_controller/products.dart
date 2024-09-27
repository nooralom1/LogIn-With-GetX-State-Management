import 'package:get/get.dart';
import 'package:login_with_getx/controller/api_controller/products.dart';
import 'package:login_with_getx/model/products.dart';

class ProductsController extends GetxController {
  List<Products>? products;
  RxBool isLoading = false.obs;

  getProducts() async {
    isLoading.value = true;
    products = await ProductsService.productsService();
    isLoading.value = false;
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
