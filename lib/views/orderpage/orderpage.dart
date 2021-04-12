import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/orderController.dart';
import 'package:rasanmart/models/orderModel.dart';

import 'trackOrder.dart';

class OrderPage extends StatelessWidget {
  final orderController = Get.put(OrderController());
  double left = 0;
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

                        // Stack(children: [
                        //   for (int i = 0;
                        //       i < orderController.orders[i].products.length;
                        //       i++, left = left + 5, print(left))
                        //     Container(
                        //       margin: EdgeInsets.only(left: left),
                        //       child: OrderImages(
                        //         products: orderController.orders[i].products,
                        //       ),
                        //     ),
                        // ]),

                        //   ]),
                        // ),
                        Container(
                          height: 50,
                          width: 60,
                          child: Stack(
                            children: [
                              orderController.orders[i].products.length >= 1
                                  ? Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: OrderImage(
                                          image: orderController.orders[0]
                                              .products[0].productImage),
                                    )
                                  : Container(),
                              orderController.orders[i].products.length >= 2
                                  ? Positioned(
                                      right: 0,
                                      top: 0,
                                      child: OrderImage(
                                          image: orderController.orders[0]
                                              .products[0].productImage),
                                    )
                                  : Container(),
                              orderController.orders[i].products.length >= 3
                                  ? Positioned(
                                      left: 0,
                                      top: 0,
                                      child: OrderImage(
                                          image: orderController.orders[0]
                                              .products[0].productImage),
                                    )
                                  : Container(),
                              orderController.orders[i].products.length >= 4
                                  ? Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: OrderImage(
                                          image: orderController.orders[0]
                                              .products[0].productImage),
                                    )
                                  : Text('')
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
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
                                "Ordered date: ${orderController.orders[i].timeStamp.toDate().toString().substring(0, 10)}\n${orderController.orders[i].timeStamp.toDate().toString().substring(10, 16)}"),
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
                              onPressed: () {
                                Get.to(OrderDetail(
                                    order: orderController.orders[i]));
                              },
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
                                  Get.to(TrackOrder(
                                      order: orderController.orders[i]));
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

class OrderImage extends StatelessWidget {
  final String image;
  const OrderImage({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(color: Colors.tr, width: 1)
        ),
        child: Image.network(
          image,
          height: 30,
          width: 30,
        ));
  }
}

class OrderDetail extends StatelessWidget {
  const OrderDetail({
    Key key,
    @required this.order,
  }) : super(key: key);

  final OrderModelModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details '),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Date :${order.timeStamp.toDate().toLocal().toString().substring(0, 10)}"),
            SizedBox(
              height: 20,
            ),
            Text(
                "Time :${order.timeStamp.toDate().toLocal().toString().substring(10, 16)}"),
            ...order.products.map((p) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      tileColor: Colors.redAccent.shade100,
                      leading: Image.network(p.productImage),
                      title: Text(
                        "${p.productName}  x ${p.qty}",
                      ),
                      subtitle: Text(''),
                      trailing: Text(
                        "Total: ${p.price * p.qty.value}",
                      )),
                ))
          ]),
    );
  }
}

// class OrderImages extends StatelessWidget {
//   final List<Product> products;
//   final double margin;
//   const OrderImages({
//     this.products,
//     this.margin,
//   });
//   //double left = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 70,
//         width: 70,
//         margin: EdgeInsets.only(left: margin),
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(5)),
//         child: FlutterLogo());
//   }
// }
