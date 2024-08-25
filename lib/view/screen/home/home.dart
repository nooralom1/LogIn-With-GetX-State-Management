import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_getx/controller/getx_controller/products.dart';
import 'package:login_with_getx/view/common_widgets/common_text.dart';
import 'package:login_with_getx/view/screen/product_details/product_details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController controller = Get.put(ProductsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: SizedBox(
          height: 42,
          child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: "Search here",
                suffixIcon: Icon(Icons.search),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ),
      body: Obx(()=>controller.isLoading.isTrue?Center(child: CircularProgressIndicator(),):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView.builder(
            itemCount: controller.products?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(()=>ProductDetails());
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 2)
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.maxFinite,
                        child: Image.network("https://cit-ecommerce-codecanyon.bandhantrade.com/${controller.products?[index].image}"),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(title: "Name: ${controller.products?[index].nameEn}",maxLine: 2,fSize: 14,fWeight: FontWeight.bold,),
                            CommonText(title: "Rating: ${controller.products?[index].rating}",fSize: 13,fWeight: FontWeight.w700,fColor: Colors.orange,),
                            CommonText(title: "Price: ${controller.products?[index].stock} BDT",fSize: 13,fWeight: FontWeight.w600,fColor: Colors.deepOrange,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),)
    );
  }
}
