import 'package:carousel_pro/carousel_pro.dart';
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
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => scaffoldKey.currentState.openDrawer(),
          ),
          title: Row(
            children: [
              Text(
                'rasan',
                style: TextStyle(
                    color: Colors.yellow.shade900, fontStyle: FontStyle.italic),
              ),
              Text(
                'mart',
                style: TextStyle(
                    color: Colors.redAccent[700], fontStyle: FontStyle.italic),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () {
                  Get.snackbar("Error creating user", 'e.message');
                  Get.to(CartPage());
                })
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(children: [
                // Container(
                //   color: Colors.red.shade900,
                //   child: Row(children: [
                //     IconButton(
                //       icon: Icon(
                //         Icons.menu,
                //         color: Colors.white,
                //       ),
                //       onPressed: () {
                //         scaffoldKey.currentState.openDrawer();
                //         // scaffoldKey
                //       },
                //     ),
                //     Text(
                //       'RasanMart',
                //       style: TextStyle(),
                //     ),
                //     Spacer(),
                //     IconButton(
                //       icon: Icon(Icons.shopping_cart),
                //       onPressed: () {
                //         Get.to(CartPage());
                //       },
                //     )
                //   ]),
                // ),
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
                    hintText: "Search products here",
                    hintStyle: TextStyle(fontSize: 15),
                  )),
                ),
                SizedBox(
                    height: 250.0,
                    child: Carousel(
                      indicatorBgPadding: 8,
                      images: [
                        NetworkImage(
                            'https://www.rasanmart.com/wp-content/uploads/2020/06/101953524_259183725496744_2867387748120002560_n.png'),
                        NetworkImage(
                            'https://www.rasanmart.com/wp-content/uploads/2020/06/101522295_895508060956667_1800978657359953920_n.png'),
                        NetworkImage(
                            'https://www.rasanmart.com/wp-content/uploads/2020/04/received_2656387371248213.png'),
                        //ExactAssetImage("assets/images/LaunchImage.jpg")
                      ],
                    )),

                Row(
                  children: [
                    Text(
                      'Top Products',
                      style: AppTheme.headingStyle,
                    ),
                    Spacer(),
                    Text(
                      'View All',
                      style: AppTheme.subheadingStyle,
                    )
                  ],
                ),
                SizedBox(height: 10),
                ProductContainer(
                    productController: productController,
                    cartController: cartController),
                Row(
                  children: [
                    Text(
                      'Latest Products',
                      style: AppTheme.headingStyle,
                    ),
                    Spacer(),
                    Text(
                      'View All',
                      style: AppTheme.subheadingStyle,
                    )
                  ],
                ),
                SizedBox(height: 10),
                ProductContainer(
                    productController: productController,
                    cartController: cartController)
              ]),
            ),
          ),
        ));
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key key,
    @required this.productController,
    @required this.cartController,
  }) : super(key: key);

  final ProductController productController;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .3,
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
                                //     border: Border.all(width: 1)
                                ),
                            padding: const EdgeInsets.all(8.0),
                            margin: EdgeInsets.all(5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              productController
                                                      .products[i].isSale
                                                  ? CircleAvatar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      child: Text('Sale'),
                                                    )
                                                  : Text(''),
                                              Spacer(),
                                              CircleAvatar(
                                                backgroundColor: Colors.red,
                                                child: Text(controller
                                                    .products[i].discount
                                                    .toString()),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(productController
                                      .products[i].productName),
                                  SizedBox(height: 10),
                                  Text(
                                      'Rs. ${controller.products[i].price.toString()}',
                                      style: TextStyle(color: Colors.red)),
                                  SizedBox(height: 10),
                                  Obx(() {
                                    return controller.products[i].qty.value == 0
                                        ? ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red, // background
                                              onPrimary:
                                                  Colors.white, // foreground
                                            ),
                                            onPressed: () {
                                              cartController.addToCart(
                                                  productController
                                                      .products[i]);
                                            },
                                            child: Text('ADD TO CART'),
                                          )
                                        : Row(
                                            children: [
                                              Text('Qty'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                  height: 20,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10)),
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        cartController
                                                            .removefromCart(
                                                                productController
                                                                    .products[i]);
                                                      },
                                                      child: Icon(Icons.remove,
                                                          size: iconSize))),
                                              Text(
                                                  " ${controller.products[i].qty.toString()} "),
                                              Container(
                                                  height: 20,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(10),
                                                            topRight:
                                                                Radius.circular(
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
                                          );
                                  }),
                                  SizedBox(height: 10),

                                  // Obx(() => IconButton(
                                  //       icon: controller
                                  //               .products[i].isFaourite.value
                                  //           ? Icon(Icons.star,
                                  //               size: iconSize,
                                  //               color: Colors.yellow)
                                  //           : Icon(Icons.star_border),
                                  //       onPressed: () {
                                  //         controller.products[i].isFaourite
                                  //             .toggle();
                                  //       },
                                  //     )),
                                ]));
                      })
                  : Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ));
            }));
  }
}
