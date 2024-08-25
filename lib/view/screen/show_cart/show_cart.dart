import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/controller/getx_controller/show_cart.dart';
import 'package:login_with_getx/view/common_widgets/common_text.dart';

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
          title: Text(
            "Show Cart Products",
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ListView.builder(
                      itemCount: controller.productCart?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30, left: 20, right: 20),
                          child: Container(
                            height: 150,
                            color: Colors.green,
                            child: Row(
                              children: [
                                Card(
                                  color: Colors.white,
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Nmae: ${controller.productCart?[index].productName?.en}"),
                                    Text("price: ${controller.productCart?.length}"),
                                    Text("Quantity: "),
                                  ],
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              counter--;
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              size: 30,
                                              color: Colors.deepOrange,
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("$counter"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              counter++;
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 30,
                                              color: Colors.deepOrange,
                                            ))
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete_forever,
                                          color: Colors.deepOrange,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
        ));
  }
}
