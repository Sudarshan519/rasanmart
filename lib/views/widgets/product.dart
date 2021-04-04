import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/controller/productController.dart';

class Products extends StatelessWidget {
  final productController = Get.find<ProductController>();
  final cartControlelr = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 120,
              width: 200,
              //   width: double.infinity,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (_) {
                      //   return ProductDetail(widget.product);
                      // }));
                    },
                    child: Icon(
                      Icons.pool_rounded,
                      size: 90,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        // productController.products.isSale
                        //     ? CircleAvatar(
                        //         backgroundColor: Colors.green,
                        //         child: Text('Sale'),
                        //       )
                        //     : Text(''),
                        // Spacer(),
                        // CircleAvatar(
                        //   backgroundColor: Colors.red,
                        //   child: Text(controller.product.discount.toString()),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Almonds'),
            Text('Nrs.200', style: TextStyle(color: Colors.red)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Qty'),
                SizedBox(
                  width: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                    ),
                    child: InkWell(
                        onTap: () {
                          // if (cartControlelr.cartList
                          //     .contains(cartControlelr.product))
                          //   cart.decreaseItemQuantity(cartControlelr.product);
                          // countItem(controller.product);
                        },
                        child: Icon(Icons.remove))),
                //Text('${productController.product.qty}'),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: InkWell(
                        onTap: () {
                          // cart.addProduct(controller.product);
                          // countItem(controller.product);
                        },
                        child: Icon(Icons.add))),
              ],
            ),
            Text(
              'Price(Mrps):100',
              //style: style.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ));
  }

//   countItem(p) {
//     // var map = Map();

//     // cartList.forEach((p) {
//     //   if (!map.containsKey(p)) {
//     //     map[p] = 1;
//     //   } else {
//     //     map[p] += 1;
//     //   }
//     // });
//     // print(map[p]);

//     setState(() {
//       if (p.qty == null)
//         productCount = 0;
//       else
//         productCount = p.qty;
//     });
//   }
 }
