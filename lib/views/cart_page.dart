import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';

class CartPage extends StatelessWidget {
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
         
          GetX<CartController>(
            init: CartController(),
            builder: (_) => Container(
              height: 300,
              child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (_, int i) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(cartController.cartItems[i].productName),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.green,
                                child: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      cartController.addToCart(
                                          cartController.cartItems[i]);
                                    }),
                              ),
                            ),
                            Container(
                              child: Obx(() {
                                return Text(
                                    cartController.cartItems[i].qty.toString());
                              }),
                            ),
                            Container(
                              color: Colors.green,
                              child: IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    cartController.removefromCart(
                                        cartController.cartItems[i]);
                                  }),
                            ),
                          ]),
                          Column(
                            children: [
                              InkWell(onTap: () {}, child: Icon(Icons.delete))
                            ],
                          )
                        ]);
                  }),
            ),
          ),
          Text('Total Price:${cartController.totalPrice}')
        ]),
      ),
    );
  }
}
