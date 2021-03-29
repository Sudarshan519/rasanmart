import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:rasanmart/views/widgets/const.dart';

class CheckoutPage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.shopping_cart_sharp),
        title:
            Text('CheckOut', style: headingStyle.copyWith(color: Colors.grey)),
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'Your CartItems is empty',
            style: subtitleStyle,
          )
        ]),
      ),
    );
  }
}
