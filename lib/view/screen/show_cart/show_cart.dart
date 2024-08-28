import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/controller/api_controller/apies.dart';
import 'package:login_with_getx/controller/getx_controller/show_cart.dart';

class ShowCart extends StatefulWidget {
  const ShowCart({super.key});

  @override
  State<ShowCart> createState() => _ShowCartState();
}

class _ShowCartState extends State<ShowCart> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    ShowCartController controller = Get.put(ShowCartController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "Show Cart Products",
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListView.builder(
                  itemCount: controller.productCart?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 110,
                              width: 120,
                              child: Image.network("${Apies.baseUrl}/${controller.productCart?[index].productImage}",fit: BoxFit.fill,)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("id: ${controller.productCart?[index].productId}"),
                              Text("Nmae: ${controller.productCart?[index].productName?.en}"),
                              Text("price: ${controller.productCart?[index].salePrice}"),
                              Text("Quantity: ${controller.productCart?[index].quantity}"),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              controller.deleteFromCart(
                                  id: controller
                                          .productCart?[index].productId ??
                                      0);
                            },
                            icon: const Icon(
                              Icons.delete_forever,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    counter++;
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.deepOrange,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("$counter"),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    counter--;
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 30,
                                    color: Colors.deepOrange,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
