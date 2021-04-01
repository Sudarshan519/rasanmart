import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/controller/orderController.dart';
import 'package:rasanmart/models/orderModel.dart';
import 'package:rasanmart/services/firestoreProducts.dart';
import 'package:rasanmart/views/widgets/const.dart';

class CheckoutPage extends GetWidget {
  final cartController = Get.find<CartController>();
  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    final items = cartController.cartItems;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: Icon(Icons.shopping_cart_sharp),
        title:
            Text('CheckOut', style: headingStyle.copyWith(color: Colors.grey)),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => cartController.cartItems.isEmpty
                  ? Text(
                      'Your CartItems is empty',
                      style: subtitleStyle,
                    )
                  : Expanded(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (_, int i) {
                            return ListTile(
                              title: Text(
                                items[i].productName,
                              ),
                              trailing: CircleAvatar(
                                  child: Text(items[i].qty.toString())),
                            );
                          }),
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Enter your address and other details',
                        style: headingStyle),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Address',
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Contact'),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('city'),
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ],
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Zip/Postal'),
                            TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        height: 40,
                        child: Obx(() => orderController.isloading.value
                            ? CircularProgressIndicator()
                            : TextButton(
                                style: TextButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                    backgroundColor:
                                        Theme.of(context).backgroundColor),
                                onPressed: () {
                                  // String json =
                                  //     jsonEncode(cartController.cartItems);
                                  OrderModelModel order=OrderModelModel(id:1,address:'12324',city:'city',products:cartController.cartItems,phone: 3232332,contact: 'sudarshan@gmail.com' );
                                

                                  firebaseProduct.addOrder(order);
                                },
                                child: Text('Place Order'),
                              ))),
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
