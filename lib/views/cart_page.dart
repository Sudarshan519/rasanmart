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
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey, size: 30),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Cart",
          style: AppTheme.headingStyle,
        ),
        actions: [
          Icon(Icons.shopping_cart),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CartItem(),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Obx(() {
                    return Text(
                      'Grand Total :${cartController.totalPrice}',
                      style: AppTheme.title.copyWith(
                          color: Colors.blueGrey, fontWeight: FontWeight.bold),
                    );
                  }),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
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
                  ),
                )
              ]),
        ),
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
        height: 500,
        child: ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (_, int i) {
              return Container(
                margin: EdgeInsets.all(9),
                height: 100,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Image.network(
                    cartController.cartItems[i].productImage,
                    width: 100,
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
                          icon: Icon(Icons.remove, color: Colors.red, size: 12),
                          onPressed: () {
                            cartController
                                .removefromCart(cartController.cartItems[i]);
                          }),
                    ),
                    Container(
                      child: Obx(() {
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
