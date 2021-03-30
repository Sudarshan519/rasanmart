import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/utils/app_theme.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key key,
    @required this.product,
    @required this.cartController,
  }) : super(key: key);

  final Product product;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return product.qty.value == 0
          ? Container(
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  cartController.addToCart(product);
                },
                child: Text(
                  'ADD TO CART',
                  style: AppTheme.subtitle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Row(
              children: [
                Text(
                  'Qty',
                  style:
                      AppTheme.subheadingStyle.copyWith(color: Colors.blueGrey),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 15,
                    width: 30,
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
                        child: Icon(Icons.remove, size: AppTheme.iconsize))),
                Text(" ${product.qty.toString()} "),
                Container(
                    height: 15,
                    width: 30,
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
                          size: AppTheme.iconsize,
                        ))),
              ],
            );
    });
  }
}
