
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/controller/api_controller/apies/apies.dart';
import 'package:login_with_getx/controller/getx_controller/peoduct_details.dart';
import 'package:login_with_getx/view/common_widgets/common_button.dart';
import 'package:login_with_getx/view/common_widgets/common_text.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key, required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.put(ProductDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("ProductDetails"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: CommonText(
                        title: "Images:",
                        fSize: 16,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.image.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 120,
                                    child: Image.network(
                                      "${Apies.baseUrl}/${controller.image[index]}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            title:
                                "Rating: ${controller.productDetails?.rating}",
                            fWeight: FontWeight.w600,
                            fSize: 16,
                            fColor: Colors.orange,
                          ),
                          CommonText(
                            title:
                                "Stock: ${controller.productDetails?.productStock}",
                            fWeight: FontWeight.w600,
                            fSize: 16,
                          ),
                          CommonText(
                            title:
                                "Review: ${controller.productDetails?.review}",
                            fWeight: FontWeight.w600,
                            fSize: 16,
                            fColor: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CommonText(
                        title:
                            "Description: ${controller.productDetails?.description?.en}",
                        fSize: 15,
                        maxLine: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CommonButton(
                        buttonName: "Add to cart",
                        onTap: () async{
                          controller.addToCartFunction(id: id);
                          // Get.off(() => const Home());
                        })
                  ],
                ),
        ));
  }
}
