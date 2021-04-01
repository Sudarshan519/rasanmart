import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/utils/app_theme.dart';

class CartButton extends StatelessWidget {
  CartButton({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return !cartController.checkItems(product)
          ? Container(
              padding: EdgeInsets.only(left: 5),
              height: 24,
              width: 70,
              child: InkWell(
                onTap: () {
                  cartController.addToCart(product);
                },
                child: Container(
                  //color: Colors.red,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart, size: 10, color: Colors.grey),
                      Text(
                        'ADD TO CART',
                        style: AppTheme.subtitle.copyWith(
                            color: Colors.grey,
                            fontSize: 8,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ))
          : Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Qty',
                  style: AppTheme.subheadingStyle
                      .copyWith(color: Colors.blueGrey, fontSize: 10),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                    height: 12,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppTheme.lightBackgroundColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                    ),
                    child: InkWell(
                        onTap: () {
                          cartController.removefromCart(product);
                        },
                        child:
                            Icon(Icons.remove, size: 12, color: Colors.white))),
                Obx(() => Text("${cartController.getItems(product)} ",style: TextStyle(fontSize:12),)),
                Container(
                    height: 12,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppTheme.lightBackgroundColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: InkWell(
                        onTap: () {
                          cartController.addToCart(product);
                        },
                        child: Icon(
                          Icons.add,
                          size: 12,
                          color: Colors.white,
                        ))),
              ],
            );
    });
  }
}
