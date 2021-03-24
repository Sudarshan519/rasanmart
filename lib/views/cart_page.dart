import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'checkout.dart';
import '../utils/app_theme.dart';

class CartPage extends GetWidget {
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: SafeArea(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CartItem(),
          Obx(() {
            return Text(
              'Total Price:${cartController.totalPrice}',
              style: AppTheme.subheadingStyle,
            );
          }),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.redAccent),
            child: Text('Checkout'),
            onPressed: () {
              if (cartController.count.isBlank)
                Get.snackbar('Add items to cart', 'Cart is empty');
              else {
                Get.to(CheckoutPage());
                //Get.snackbar('Checking out ', " ${cartController.count} items");
              }
            },
          )
        ]),
      ),
    );
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
            itemCount: cartController.cartItems.length,
            itemBuilder: (_, int i) {
              return Container(
                margin: EdgeInsets.all(9),
                color: Colors.greenAccent,
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        cartController.cartItems[i].productName,
                        style: AppTheme.title,
                      ),
                      Row(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                            ),
                            color: Colors.green,
                          ),
                          child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                cartController
                                    .addToCart(cartController.cartItems[i]);
                              }),
                        ),
                        Container(
                          child: Obx(() {
                            return Text(
                                " ${cartController.cartItems[i].qty.toString()}  ");
                          }),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30)),
                            color: Colors.green,
                          ),
                          child: IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                cartController.removefromCart(
                                    cartController.cartItems[i]);
                              }),
                        ),
                      ]),
                      // Column(
                      //   children: [
                      //     InkWell(onTap: () {}, child: Icon(Icons.delete))
                      //   ],
                      // )
                    ]),
              );
            }),
      ),
    );
  }
}
