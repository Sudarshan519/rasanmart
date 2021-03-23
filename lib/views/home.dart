import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/controller/productController.dart';
import 'package:rasanmart/utils/app_theme.dart';

import 'cart_page.dart';

double iconSize = 16;

class Home extends StatelessWidget {
  // final controller = Get.find<UserController>().user;
  final cartController = Get.put(CartController());
  final productController = Get.put(ProductController());
  final scaffoldKey;
  Home({this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RasanMart'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
                color: Colors.red.shade900,
                child: Row(children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      scaffoldKey.currentState.openDrawer();
                      // scaffoldKey
                    },
                  ),
                  Text(
                    'RasanMart',
                    style: TextStyle(),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Get.to(CartPage());
                    },
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextFormField(
                    decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.pink,
                    onPressed: () {},
                  ),
                  hintText: "What are you searching for ?",
                  hintStyle: TextStyle(fontSize: 15),
                )),
              ),
              Row(
                children: [
                  Text(
                    'Latest Products',
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                  height: MediaQuery.of(context).size.height * .5,
                  // decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: GetX<ProductController>(
                      init: ProductController(),
                      builder: (controller) {
                        print(productController.products.length);
                        return controller.isloading.isFalse
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.products.length,
                                itemBuilder: (_, int i) {
                                  return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1)),
                                      padding: const EdgeInsets.all(8.0),
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              //  color: Colors.white,
                                              height: 120,
                                              width: 150,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Image.asset(
                                                      "assets/products/product1.jpg",
                                                      height: 120,
                                                      width: 150,
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    padding: EdgeInsets.all(5),
                                                    child: Row(
                                                      children: [
                                                        productController
                                                                .products[i]
                                                                .isSale
                                                            ? CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                child: Text(
                                                                    'Sale'),
                                                              )
                                                            : Text(''),
                                                        Spacer(),
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          child: Text(controller
                                                              .products[i]
                                                              .discount
                                                              .toString()),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(productController
                                                .products[i].productName),
                                            Text(
                                                'Rs. ${controller.products[i].price.toString()}',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                            // controller.products[i].qty == 0
                                            //     ? ElevatedButton(
                                            //         onPressed: () {
                                            //           cartController.addToCart(
                                            //               controller.products[i]);
                                            //         },
                                            //         child: Text('Add to cart'),
                                            //       )  :

                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Qty'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                    child: InkWell(
                                                        onTap: () {
                                                          cartController
                                                              .removefromCart(
                                                                  productController
                                                                      .products[i]);
                                                        },
                                                        child: Icon(
                                                            Icons.remove,
                                                            size: iconSize))),
                                                Obx(() {
                                                  return Text(controller
                                                      .products[i].qty
                                                      .toString());
                                                }),
                                                Container(
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                    child: InkWell(
                                                        onTap: () {
                                                          cartController.addToCart(
                                                              productController
                                                                  .products[i]);
                                                          // countItem(controller.product);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          size: iconSize,
                                                        ))),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Price(Mrps):${productController.products[i].price}',
                                              style: AppTheme.subtitle,
                                              //style: style.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(controller
                                                    .products[i].productName),
                                              ],
                                            ),
                                            Obx(() => IconButton(
                                                  icon: controller.products[i]
                                                          .isFaourite.value
                                                      ? Icon(Icons.star,
                                                          size: iconSize,
                                                          color: Colors.yellow)
                                                      : Icon(Icons.star_border),
                                                  onPressed: () {
                                                    controller
                                                        .products[i].isFaourite
                                                        .toggle();
                                                  },
                                                )),
                                          ]));
                                })
                            : Center(
                                child: CircularProgressIndicator(
                                strokeWidth: 3,
                              ));
                      }))
            ]),
          ),
        ));
  }
}
