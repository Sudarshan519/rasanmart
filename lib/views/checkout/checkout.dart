import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/controller/orderController.dart';
import 'package:rasanmart/controller/userController.dart';
import 'package:rasanmart/models/orderModel.dart';
import 'package:rasanmart/services/authService.dart';
import 'package:rasanmart/services/firestoreProducts.dart';
import 'package:rasanmart/views/dashboard/dashboard_page.dart';
import 'package:rasanmart/views/widgets/const.dart';
import 'package:rasanmart/views/widgets/custom_textfield.dart';

import '../../controller/authController.dart';
import '../../controller/orderController.dart';

class CheckoutPage extends GetWidget {
  final cartController = Get.find<CartController>();
  final authController = Get.find<AuthController>();
  final orderController = Get.put(OrderController());
  final userController = Get.find<UserController>();
  final address = TextEditingController();
  final contact = TextEditingController();
  final city = TextEditingController();
  final zip = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final items = cartController.cartItems;
    return Scaffold(
      //  backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Theme.of(context).accentColor),
        ),
        title: Text('CheckOut',
            style: headingStyle.copyWith(color: Theme.of(context).accentColor)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

          ///  height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => cartController.cartItems.isEmpty
                    ? Text(
                        'Your CartItems is empty',
                        style: subtitleStyle,
                      )
                    : Column(
                        children: [
                          Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.3),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 2,
                                    width: double.infinity,
                                    color: Colors.red.shade900,
                                  ),
                                  SizedBox(height: 10),
                                  authController.firebaseUser == null
                                      ? Text('Get special offers by signing in',
                                          style: TextStyle(
                                              color: Colors.grey[800]))
                                      : Text(
                                          'Get coupon code',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.3),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 2,
                                    width: double.infinity,
                                    color: Colors.red.shade900,
                                    child: authController.user == null
                                        ? Text(
                                            'Get special offers by signing in',
                                            style:
                                                TextStyle(color: Colors.black))
                                        : Text(
                                            'Get coupon code',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Have a coupon?',
                                        style:
                                            TextStyle(color: Colors.grey[800]),
                                      ),
                                      Text(' Click here to enter your code',
                                          style: TextStyle(
                                              color: Colors.red.shade800))
                                    ],
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 30,
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            color: Colors.red.shade900,
                            child: Text(
                              'Billing details',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('SNO',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text('Name',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  child: Text('Price',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Expanded(
                                  child: Text('Total',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                                // Expanded(
                                //   child: Text('Total Discount',
                                //       style: TextStyle(
                                //           fontSize: 12,
                                //           fontWeight: FontWeight.bold)),
                                // ),
                              ],
                            ),
                          ),
                          Divider(),
                          for (int i = 0; i < items.length; i++)
                            Container(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: Text('${i + 1}.',
                                            style: TextStyle(fontSize: 12))),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                          "${items[i].productName} x${items[i].qty}",
                                          style: TextStyle(fontSize: 12)),
                                    ),
                                    Expanded(
                                      child: Text(items[i].price.toString(),
                                          style: TextStyle(fontSize: 12)),
                                    ),
                                    Expanded(
                                      child: Text(
                                          (items[i].price * items[i].qty.value)
                                              .toString(),
                                          style: TextStyle(fontSize: 12)),
                                    ),
                                    // Expanded(
                                    //   child: Text(
                                    //       (items[i].price *
                                    //               items[i].discount /
                                    //               100 *
                                    //               items[i].qty.value)
                                    //           .toString(),
                                    //       style: TextStyle(fontSize: 12)),
                                    // ),
                                  ],
                                ),
                                Divider(),
                              ]),
                            ),
                        ],
                      )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Amount', style: TextStyle()),
                            Spacer(),
                            Text(
                              '${cartController.totalPrice}',
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Total Discount',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '(-) ${cartController.discount}',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          children: [
                            Text(
                              'Delivery charge',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              '+ 100.0',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Grand Total',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(),
                              Text(
                                  '${cartController.totalPrice - cartController.discount + 100}'),
                            ],
                          )),
                    ],
                  ),
                ),
                OrderForm(
                    formKey: _formKey,
                    //contact: contact,
                    orderController: orderController,
                    authController: authController,
                    cartController: cartController)
              ]),
        ),
      ),
    );
  }
}

class OrderForm extends StatelessWidget {
  const OrderForm({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.orderController,
    @required this.authController,
    @required this.cartController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  // final TextEditingController contact;
  final OrderController orderController;
  final AuthController authController;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    // allStorage.clearuser();
//    print(authController.user.email);
    final email = TextEditingController();
    final city = TextEditingController();
    final zip = TextEditingController();
    final street = TextEditingController();
    final phone = TextEditingController();
    email.text = authController.user.email;
    city.text = userController.user.value.city;
    zip.text = userController.user.value.zip;
    street.text = userController.user.value.street;
    phone.text = userController.user.value.phone;
    print(userController.user.value.city);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter your address and other details',
                style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   'Address',
            //   style: TextStyle(fontSize: 12),
            // ),
            // CustomTextField(
            //   controller: address,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Text('Email', style: TextStyle(fontSize: 12)),
            CustomTextField(
              hintText: 'email',
              controller: email,
              inputBorder: OutlineInputBorder(),
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
                    Text('City',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    CustomTextField(
                      inputBorder: OutlineInputBorder(),
                      hintText: 'City',
                      controller: city,
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
                    Text(
                      'Zip/Postal',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    CustomTextField(
                      inputBorder: OutlineInputBorder(),
                      controller: zip,
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Street Address',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            CustomTextField(
              inputBorder: OutlineInputBorder(),
              controller: street,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Phone',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            CustomTextField(
              inputBorder: OutlineInputBorder(),
              textInputType: TextInputType.number,
              controller: phone,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              color: Colors.grey.withOpacity(.3),
              child: Column(
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Radio(
                            activeColor: Colors.red,
                            value: 'k',
                            groupValue: orderController.pay.value,
                            onChanged: (v) {
                              print(v);
                              orderController.pay.value = v;
                            }),
                      ),
                      Text('Cash on delivery'),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Radio(
                            activeColor: Colors.red,
                            value: 'p',
                            groupValue: orderController.pay.value,
                            onChanged: (v) {
                              //        print(v);

                              orderController.pay.value = v;
                            }),
                      ),
                      Text('Khalti'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 70,
              child: Row(
                children: [
                  Obx(() => Checkbox(
                      activeColor: Theme.of(context).backgroundColor,
                      value: orderController.terms.value,
                      onChanged: (v) {
                        orderController.terms.value = v;
                      })),
                  SizedBox(
                    width: 10,
                  ),
                  Text('I have accepted terms and conditions'),
                ],
              ),
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
                            backgroundColor: Theme.of(context).backgroundColor),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (authController.user != null) {
                              orderController.id.value =
                                  authController.user.uid;
                            } else {
                              orderController.id.value =
                                  await authService.signInAnonymously();
                            }
                            OrderModelModel order = OrderModelModel(
                              id: orderController.id.value,
                              address: street.text,
                              city: city.text,
                              products: cartController.cartItems,
                              phone: int.parse(phone.text),
                              email: email.text,
                            );
                            print(order.id);

                            firebaseProduct.addOrder(order);
                            cartController.clearCart();
                            Get.off(DashboardPage());
                          }
                        },
                        child: Text('Place Order'),
                      ))),
          ],
        ),
      ),
    );
  }
}
