import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/orderController.dart';
import 'package:rasanmart/models/productModel.dart';

import 'trackOrder.dart';

class OrderPage extends StatelessWidget {
  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    orderController.getOrder();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'My Orders',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Obx(() => orderController.isloading.value
          ? Center(
              child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).backgroundColor),
            )
          : ListView.builder(
              itemCount: orderController.orders.length,
              reverse: true,
              itemBuilder: (_, int i) {
                return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400].withOpacity(.2),
                    ),
                    child: Row(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Stack(children: [
                        //     // for (i = 0;
                        //     //     i < orderController.orders[i].products.length;
                        //     //     i++)
                        //     //

                        //     // for (Product product
                        //     //     in orderController.orders[i].products)
                        //     //   OrderImages(
                        //     //     margin: orderController.,
                        //     //   ),
                        //     //
                        OrderImages(),

                        // OrderImages(
                        //   margin: 20,
                        // ),
                        //   ]),
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...orderController.orders[i].products
                                .map((p) => Column(
                                      children: [
                                        Text(
                                            "${p.productName} X ${p.qty.toString()}")
                                      ],
                                    )),
                            Text(
                                "Ordered date: ${orderController.orders[i].timeStamp.toDate().toString().substring(0, 10)}\n${orderController.orders[i].timeStamp.toDate().toString().substring(10)}"),
                            //orderController.orders[i].products...
                            // Text(
                            //   orderController.orders[i].products.toString(),
                            //   style: TextStyle(color: Colors.white),
                            // ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '    Details    ',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: Colors.white,
                                  backgroundColor: Colors.green.shade800),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.red.shade800,
                                    primary: Colors.white),
                                onPressed: () {
                                  Get.to(TrackOrder(order:orderController.orders[i]));
                                },
                                child: Text(
                                  'Track Order',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                )),
                          ],
                        ),
                        SizedBox(width: 10)
                      ],
                    )

                    //  ListTile(
                    //   title: Text(
                    //     orderController.orders[i].email,
                    //   ),
                    //   subtitle: Text(
                    //       "Ordered date: ${orderController.orders[i].timeStamp.toDate().toString().substring(0, 10)}"),
                    //   trailing: Column(
                    //     children: [
                    //       Container(
                    //           height: 20,
                    //           width: 70,
                    //           alignment: Alignment.center,
                    //           decoration: BoxDecoration(
                    //               color:
                    //                   orderController.orders[i].status == 'sent'
                    //                       ? Colors.yellow
                    //                       : Colors.green,
                    //               borderRadius: BorderRadius.circular(10)),
                    //           child: orderController.orders[i].status != 'sent'
                    //               ? Text(orderController.orders[i].status)
                    //               : Text('Cancel')),
                    //       SizedBox(height: 10),
                    //       Container(
                    //           height: 20,
                    //           width: 90,
                    //           alignment: Alignment.center,
                    //           decoration: BoxDecoration(
                    //               color:
                    //                   orderController.orders[i].status == 'sent'
                    //                       ? Colors.yellow
                    //                       : Colors.green,
                    //               borderRadius: BorderRadius.circular(10)),
                    //           child: orderController.orders[i].status != 'sent'
                    //               ? Text(orderController.orders[i].status)
                    //               : Text('Track Order')),
                    //     ],
                    //   ),
                    // ),
                    );
              })),
    );
  }
}

class OrderImages extends StatelessWidget {
  final double margin;
  const OrderImages({
    Key key,
    this.margin = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 70,
        margin: EdgeInsets.only(left: margin),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: FlutterLogo());
  }
}
