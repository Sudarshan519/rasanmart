import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/controller/networkController.dart';
import 'package:rasanmart/controller/productController.dart';
import 'package:rasanmart/models/category_model.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/cartpage/cart_page.dart';
import 'package:rasanmart/views/categories/categories_page.dart';
import 'package:rasanmart/views/search/search_field.dart';
import 'package:rasanmart/views/widgets/const.dart';
import 'package:rasanmart/views/widgets/productContent.dart';
import '../categories.dart';

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

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      leading: IconButton(
        icon: Icon(
          Icons.sort,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => widget.scaffoldKey.currentState.openDrawer(),
      ),
      title: !_show
          ? Row(
              children: [
                Text(
                  'Rasan',
                  style: TextStyle(
                      color: Colors.yellow, fontStyle: FontStyle.normal),
                ),
                Text(
                  'mart',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              ],
            )
          : SearchField(),
      actions: [
        Icon(
          Icons.notifications,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
        IconButton(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 7,
                      child: Obx(() {
                        return Text(
                          '${cartController.count}',
                          style: AppTheme.subtitle.copyWith(
                              fontSize: 12,
                              color: Theme.of(context).backgroundColor),
                        );
                      }),
                    ))
              ],
            ),
            onPressed: () {
              Get.to(CartPage());
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: _scrollBottomBarController,
            child: Column(children: [
              networkController.connectionStatus.value == 0
                  ? Text('Connect to Internet')
                  : Container(),
              SearchField(),
              CarouselPro(),
              SizedBox(height: 10),
              CategoriesContainer(productController: productController),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Top Products',
                    style: AppTheme.headingStyle,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      String item = 'topProducts';
                      Get.to(
                        Categories(item: item),
                      );
                    },
                    child: Text(
                      'View All',
                      style: AppTheme.subheadingStyle,
                    ),
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

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    Key key,
    @required this.productController,
  }) : super(key: key);

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Categories',
        style: headingStyle,
      ),
      SizedBox(height: 10),
      Container(
        height: 170,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (context, int i) {
            return InkWell(
              onTap: () {
                Get.to(CategoriesPage(category[i].categoryName,
                    productController.cagegoryItems(category[i].categoryName)));
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.blue,
                      height: 30,
                      width: 30,
                      child: Image.network(
                        category[i].categoryImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      category[i].categoryName,
                      textAlign: TextAlign.center,
                      style: subtitleStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ]),
            );
          },
        ),
      )
    ]);
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
          indicatorBgPadding: 0,
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
        height: MediaQuery.of(context).size.height * .3,
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
                        //  print(productController.products[i].dateTime);
                        //  print(productController.products[i].dateTime
                        //     .compareTo(Timestamp.fromDate(DateTime.now())));
                        DateTime productadded =
                            productController.products[i].dateTime.toDate();
                        var dDay = new DateTime.now();
                        Duration difference = dDay.difference(productadded);
                        //print(difference);
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
