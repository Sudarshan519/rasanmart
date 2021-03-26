import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/views/widgets/cartButton.dart';

import '../controller/cartController.dart';
import '../controller/productController.dart';
import '../utils/app_theme.dart';
import '../controller/changeImageController.dart';
import '../views/widgets/productContent.dart';

final List imagelist = [
  'https://www.rasanmart.com/wp-content/uploads/2020/10/rasan-mart-dahivada-1-300x300.jpg',
  'https://www.rasanmart.com/wp-content/uploads/2020/10/rasan-mart-dahivada-1-300x300.jpg',
  'https://www.rasanmart.com/wp-content/uploads/2020/10/rasan-mart-dahivada-1-300x300.jpg',
  'https://www.rasanmart.com/wp-content/uploads/2020/07/rasan-mart-2pmakbare.jpg',
];

class ProductDetail extends GetWidget<ImageController> {
  final Product product;
  final cartController = Get.find<CartController>();
  final image = Get.put(ImageController());
  ProductDetail(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Center(
                    child: Text(
                      product.productName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Obx(() {
                    switch (image.selectedIndex.value) {
                      case 0:
                        return Image.network(
                            imagelist[image.selectedIndex.value]);
                        break;
                      default:
                        return Image.network(
                            imagelist[image.selectedIndex.value]);
                    }
                  }),
                  height: 180),
              SizedBox(height: 10),
              Wrap(children: [
                ...imagelist.map((p) => InkWell(
                    onTap: () {
                      image.selectedIndex.value = imagelist.indexOf(p);
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Image.network(p, height: 80, width: 80)))),
                // InkWell(
                //   onTap: (){
                //     _selectedIcon=icon[i]
                //   },
              ]),
              Container(
                color: AppTheme.lightBackgroundColor,
                height: 20,
                child: Text(
                  ' 10% off  ',
                  style: AppTheme.subheadingStyle
                      .copyWith(color: Colors.grey[350]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'NRs. ${product.price}',
                    style: AppTheme.subheadingStyle,
                  ),
                  Text(
                    '(NRs. 50)',
                    style: AppTheme.subtitle.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Prodcut Description',
                style: AppTheme.subheadingStyle.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                product.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 20,
              ),
              CartButton(product: product, cartController: cartController),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     SizedBox(
              //       width: 90,
              //     ),
              //     Text(
              //       'Qty',
              //       style:
              //           AppTheme.subheadingStyle.copyWith(color: Colors.black),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: AppTheme.lightBackgroundColor,
              //       ),
              //       height: 15,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           InkWell(
              //               onTap: () {
              //                 cartController.removefromCart(product);
              //               },
              //               child: Container(
              //                 width: 15,
              //                 child: Icon(Icons.remove,
              //                     size: 15, color: Colors.white),
              //               )),
              //           Container(
              //               alignment: Alignment.center,
              //               color: Colors.white,
              //               child: Obx(() {
              //                 return Text(
              //                   " ${product.qty.value.toString()} ",
              //                   style: AppTheme.subheadingStyle
              //                       .copyWith(fontSize: 10),
              //                 );
              //               })),
              //           InkWell(
              //             onTap: () {
              //               cartController.addToCart(product);
              //             },
              //             child: Icon(
              //               Icons.add,
              //               size: 15,
              //               color: Colors.white,
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Price (NRs.)     ${product.price}',
                style: AppTheme.headingStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Row(
                children: [
                  Text('Similar Products', style: AppTheme.headingStyle),
                  Spacer(),
                  Text(
                    'View All',
                    style: AppTheme.subheadingStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width,
                  child: GetX<ProductController>(
                      init: ProductController(),
                      builder: (controller) {
                        print(controller.products.length);
                        return controller.isloading.isFalse
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 0,
                                  //mainAxisExtent: 150.0,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.products.length,
                                itemBuilder: (_, int i) {
                                  return ProductContent(controller.products[i]);
                                })
                            : Center(
                                child: CircularProgressIndicator(
                                strokeWidth: 3,
                              ));
                      }))
            ],
          ),
        ),
      ),
    ));
  }
}
