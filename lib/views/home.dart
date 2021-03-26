import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/controller/productController.dart';
import 'package:rasanmart/utils/app_theme.dart';
import '../utils/app_theme.dart';
import '../views/widgets/productContent.dart';
import 'cart_page.dart';
import './widgets/carousel_slider.dart';
import '../services/getStorage.dart';

class Home extends StatefulWidget {
  final scaffoldKey;
  Home({this.scaffoldKey});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final cartController = Get.put(CartController());

  final productController = Get.put(ProductController());

  ScrollController _scrollBottomBarController = new ScrollController();
  bool _show;

  writeStorage() async {
    await cartStorage.write('cart', cartController.cartItems.toJson());
  }

  readStorage() async {
    String prod = await cartStorage.read('cart');
    print(prod);
  }

  @override
  void initState() {
    super.initState();

    //Get.putAsync<ProductController>(() async => await ProductController());
    _show = false;
    _scrollBottomBarController.removeListener(() {});
    myScroll();
  }

  @override
  void dispose() {
    _scrollBottomBarController.dispose();
    super.dispose();
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.pixels > 80) {
        setState(() {
          _show = true;
          //  print(_show);
        });
      } else {
        setState(() {
          _show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            size: 30,
            color: Colors.grey,
          ),
          onPressed: () => widget.scaffoldKey.currentState.openDrawer(),
        ),
        title: !_show
            ? Row(
                children: [
                  Text(
                    'rasan',
                    style: TextStyle(
                        color: Colors.yellow.shade900,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'mart',
                    style: TextStyle(
                        color: Colors.redAccent[700],
                        fontStyle: FontStyle.italic),
                  )
                ],
              )
            : SearchField(),
        actions: [
          IconButton(
              icon: Stack(
                children: [
                  Icon(
                    Icons.shopping_basket,
                    color: Colors.grey,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundColor: AppTheme.lightBackgroundColor,
                        radius: 7,
                        child: Obx(() {
                          return Text(
                            '${cartController.count}',
                            style: AppTheme.subtitle
                                .copyWith(fontSize: 12, color: Colors.white),
                          );
                        }),
                      ))
                ],
              ),
              onPressed: () {
                // Get.snackbar("Error creating user", 'e.message');
                Get.to(CartPage());
              }),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            controller: _scrollBottomBarController,
            child: Column(children: [
              SearchField(), //: Text(''),
              //ComplicatedImageDemo(),
              CarouselPro(),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Top Products',
                    style: AppTheme.headingStyle,
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: AppTheme.subheadingStyle,
                  )
                ],
              ),
              SizedBox(height: 10),
              TopProductContainer(
                  productController: productController,
                  cartController: cartController),
              Divider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Latest Products',
                    style: AppTheme.headingStyle,
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: AppTheme.subheadingStyle,
                  )
                ],
              ),
              SizedBox(height: 15),
              LatestProductContainer(
                  productController: productController,
                  cartController: cartController)
            ]),
          ),
        ),
      ),
    );
  }
}

class CarouselPro extends StatelessWidget {
  const CarouselPro({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: Carousel(
          indicatorBgPadding: 8,
          images: [
            NetworkImage(
              'https://www.rasanmart.com/wp-content/uploads/2020/06/101953524_259183725496744_2867387748120002560_n.png',
            ),
            NetworkImage(
                'https://www.rasanmart.com/wp-content/uploads/2020/06/101522295_895508060956667_1800978657359953920_n.png'),
            NetworkImage(
                'https://www.rasanmart.com/wp-content/uploads/2020/04/received_2656387371248213.png'),
            //ExactAssetImage("assets/images/LaunchImage.jpg")
          ],
        ));
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextFormField(
          decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(),
        prefixIcon: IconButton(
          icon: Icon(Icons.search),
          color: Colors.pink,
          onPressed: () {},
        ),
        hintText: "Search products here",
        hintStyle: TextStyle(fontSize: 15),
      )),
    );
  }
}

class TopProductContainer extends StatelessWidget {
  const TopProductContainer({
    Key key,
    @required this.productController,
    @required this.cartController,
  }) : super(key: key);

  final ProductController productController;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(border: Border.all(width: 1)),
        child: GetX<ProductController>(
            init: ProductController(),
            builder: (controller) {
             // print(productController.products.length);
              return controller.isloading.isFalse
                  ? GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.products.length,
                      itemBuilder: (_, int i) {
                        if (productController.products[i].totalFavourite > 100)
                          return ProductContent(productController.products[i]);
                        else
                          return null;
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 30,
                        mainAxisExtent: 150.0,
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ));
            }));
  }
}

class LatestProductContainer extends StatelessWidget {
  const LatestProductContainer({
    Key key,
    @required this.productController,
    @required this.cartController,
  }) : super(key: key);

  final ProductController productController;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(border: Border.all(width: 1)),
        child: GetX<ProductController>(
            init: ProductController(),
            builder: (controller) {
              return controller.isloading.isFalse
                  ? GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.products.length,
                      itemBuilder: (_, int i) {
                        print(productController.products[i].dateTime);
                        //  print(productController.products[i].dateTime
                        //     .compareTo(Timestamp.fromDate(DateTime.now())));
                        DateTime productadded =
                            productController.products[i].dateTime.toDate();
                        var dDay = new DateTime.now();
                        Duration difference = dDay.difference(productadded);
                        print(difference);
                        if (difference < Duration(days: 99))
                          return ProductContent(productController.products[i]);
                        else
                          return null;
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 30,
                        mainAxisExtent: 150.0,
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ));
            }));
  }
}
// class ProductDetail extends StatelessWidget {
//   const ProductDetail({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Text(controller.products[i].productName),);
//   }
// }
