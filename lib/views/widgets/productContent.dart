import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './cartButton.dart';
import '../../utils/app_theme.dart';
import 'package:rasanmart/models/productModel.dart';

import '../product_detail.dart';

double fontSize = 12;

class ProductContent extends StatelessWidget {
  final Product product;

  ProductContent(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Card(
        //color: Colors.grey[300],
        // margin: EdgeInsets.only(left: 30, right: 10, top: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(ProductDetail(product));
              },
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.network(
                    product.productImage,
                    height: 120,
                    width: 120,
                  ),
                  Row(
                    children: [
                      product.isSale
                          ? CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.greenAccent[400],
                              child: Text('Sale',
                                  style: AppTheme.subtitle
                                      .copyWith(color: Colors.white)),
                            )
                          : Text(''),
                      Spacer(),
                      product.discount != 0 || product.discount == null
                          ? CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.redAccent[400],
                              child: Text(product.discount.toString(),
                                  style: AppTheme.subtitle.copyWith(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic)),
                            )
                          : Text(''),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Text(product.productName),
            SizedBox(height: 5),
            Text('Rs. ${product.price.toString()}',
                style: TextStyle(color: Colors.red)),
            SizedBox(height: 5),
            SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 20,
                child: CartButton(
                  product: product,
                ),
              ),
              SizedBox(width: 5),
            ]),
            // SizedBox(height: 10,),
            // InkWell(
            //   onTap: () {
            //     Get.to(ProductDetail(product));
            //   },
            //   child: Container(
            //       width: 60,
            //       padding: EdgeInsets.all(5),
            //       decoration: BoxDecoration(
            //         border: Border.all(color: Colors.grey),
            //         borderRadius: BorderRadius.circular(5),
            //       ),
            //       child: Row(
            //         children: [
            //           Icon(Icons.remove_red_eye, size: 10, color: Colors.grey),
            //           Text('Details',
            //               style: AppTheme.subtitle.copyWith(
            //                   fontWeight: FontWeight.w400,
            //                   color: Colors.grey,
            //                   fontSize: 10))
            //         ],
            //       )),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Container(
            //         alignment: Alignment.center,
            //         height: 22,
            //         decoration: BoxDecoration(
            //             border: Border.all(
            //           color: Colors.grey,
            //         )),
            //         child: Row(
            //           children: [
            //             Icon(FontAwesomeIcons.thumbsUp,
            //                 size: 10, color: Colors.grey),
            //             Text(
            //               product.totalFavourite.toString(),
            //               style: TextStyle(color: Colors.grey, fontSize: 12),
            //             ),
            //           ],
            //         )),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
