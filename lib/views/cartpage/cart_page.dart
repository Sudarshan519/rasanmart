import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/checkout/checkout.dart';

final scrollController = ScrollController();

class CartPage extends GetWidget {
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey, size: 30),
            onPressed: () {
              Get.back();
            },
          ),
          title: Row(
            children: [
              Icon(Icons.shopping_cart, size: 20, color: Colors.white),
              SizedBox(
                height: 20,
              ),
              Text(
                "Cart",
                style: AppTheme.headingStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
          actions: [],
        ),
        body: Obx(
          () => cartController.cartItems.length == 0
              ? Center(child: Text('Your cart is empty'))
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: CartItem()),
                      Text(
                        'Delivery Charge : 100',
                        style: AppTheme.title.copyWith(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GetX<CartController>(
                          init: CartController(),
                          builder: (_) => Text(
                                'Grand Total :${_.totalPrice}',
                                style: AppTheme.title.copyWith(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                              )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent),
                          child: Text('Checkout'),
                          onPressed: () {
                            if (cartController.count.isBlank)
                              Get.snackbar(
                                  'Add items to cart', 'Cart is empty');
                            else {
                              Get.to(CheckoutPage(),transition: Transition.rightToLeft);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}

class CartItem extends StatelessWidget {
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(
      init: CartController(),
      builder: (_) => Container(
        height: 300,
        child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            itemCount: cartController.cartItems.length,
            itemBuilder: (_, int i) {
              return Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                      ),
                      child: Image.network(
                        cartController.cartItems[i].productImage,
                        width: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cartController.cartItems[i].productName,
                            style: AppTheme.subtitle.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Price: Rs. ${cartController.cartItems[i].price}",
                            style: AppTheme.subtitle
                                .copyWith(color: Colors.blueGrey),
                          ),
                          Obx(
                            () {
                              return Text(
                                "Total: Rs. ${cartController.cartItems[i].price * cartController.cartItems[i].qty.value}",
                                style: AppTheme.subtitle
                                    .copyWith(color: Colors.blueGrey),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: IconButton(
                            icon:
                                Icon(Icons.remove, color: Colors.red, size: 12),
                            onPressed: () {
                              cartController
                                  .removefromCart(cartController.cartItems[i]);
                            }),
                      ),
                      Container(
                        child: Obx(() {
                          print(cartController.cartItems[i].qty);
                          return Text(
                              "   ${cartController.cartItems[i].qty.toString()}    ",
                              style: AppTheme.subheadingStyle
                                  .copyWith(color: Colors.red));
                        }),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: IconButton(
                            icon: Icon(Icons.add, color: Colors.red, size: 12),
                            onPressed: () {
                              cartController
                                  .addToCart(cartController.cartItems[i]);
                            }),
                      ),
                    ]),
                    SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              title: 'Delete Alert',
                              content: Column(
                                children: [
                                  Text('Are you sure you want to delete item?'),
                                  Row(
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: Text('Delete'),
                                        onPressed: () {
                                          cartController.deleteItem(
                                              cartController.cartItems[i]);
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ));
                        },
                        child: Icon(Icons.delete, color: Colors.deepOrange))
                  ]),
                ],
              );
            }),
      ),
    );
  }
}
