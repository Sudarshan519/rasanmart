import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import './cartButton.dart';
import '../../utils/app_theme.dart';
import 'package:rasanmart/models/productModel.dart';

import '../product_detail.dart';

class ProductContent extends StatelessWidget {
  final Product product;

  ProductContent(this.product);

  @override
  Widget build(BuildContext context) {
    // final cartController = Get.find<CartController>();
    return Column(children: [
      Expanded(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.network(
              product.productImage,
              // height: 200,
              // width: 200,
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
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.redAccent[400],
                  child: Text(product.discount.toString(),
                      style: AppTheme.subtitle.copyWith(
                          color: Colors.white, fontStyle: FontStyle.italic)),
                ),
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
      CartButton(
        product: product,
      ),
      SizedBox(height: 10),
      InkWell(
        onTap: () {
          Get.to(ProductDetail(product));
        },
        child: Container(
            padding: EdgeInsets.only(left: 5, right: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Quick View',
              style: AppTheme.subtitle.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            )),
      ),
      Row(
        children: [
          CircleAvatar(
              radius: 10, child: Icon(FontAwesomeIcons.thumbsUp, size: 10)),
          Text(
            product.totalFavourite.toString(),
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      // Divider(),
      // Obx(() => Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         InkWell(
      //           onTap: () {
      //             firebaseProduct.addlike();
      //             product.isFaourite.toggle();
      //           },
      //           child: product.isFaourite.value
      //               ? Icon(
      //                   Icons.thumb_up_alt_outlined,
      //                   color: Colors.grey,
      //                 )
      //               : Icon(FontAwesomeIcons.thumbsUp,
      //                   color: Colors.redAccent.shade700),
      //         ),
      // InkWell(
      //   child: product.isFaourite.value
      //       ? Icon(Icons.star, size: 15, color: Colors.yellow)
      //       : Icon(Icons.star_border, size: 10),
      //   onTap: () {
      //     product.isFaourite.toggle();
      //   },
      // ),
      // InkWell(
      //   child: product.isFaourite.value
      //       ? Icon(Icons.star, size: 15, color: Colors.yellow)
      //       : Icon(Icons.star_border, size: 10),
      //   onTap: () {
      //     product.isFaourite.toggle();
      //   },
      // ),
      // InkWell(
      //   child: product.isFaourite.value
      //       ? Icon(Icons.star, size: 15, color: Colors.yellow)
      //       : Icon(Icons.star_border, size: 10),
      //   onTap: () {
      //     product.isFaourite.toggle();
      //   },
      // ),
      //    ],
      //)),
    ]);
  }
}
