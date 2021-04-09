import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rasanmart/app/modules/CompleteProfile/views/complete_profile_view.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/controller/networkController.dart';
import 'package:rasanmart/controller/productController.dart';
import 'package:rasanmart/controller/userController.dart';
import 'package:rasanmart/models/category_model.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/cartpage/cart_page.dart';
import 'package:rasanmart/views/categories/categories_page.dart';
import 'package:rasanmart/views/notification/notifications.dart';
import 'package:rasanmart/views/search/search_field.dart';
import 'package:rasanmart/views/widgets/cartButton.dart';
import 'package:rasanmart/views/widgets/const.dart';
import '../../utils/size_util.dart';
import '../product_detail.dart';

final productController = Get.put(ProductController());

class Home extends StatefulWidget {
  final scaffoldKey;
  Home({this.scaffoldKey});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollBottomBarController = ScrollController();
  final cartController = Get.put(CartController());
  final userController = Get.find<UserController>();
  final searchController = TextEditingController();
  final networkController =
      Get.find<NetworkController>() ?? Get.put(NetworkController());

  bool _show;
  bool upDirection = true;
  @override
  void initState() {
    super.initState();

    _show = false;
    _scrollBottomBarController.removeListener(() {});
    myScroll();
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

  checkScroll() {
    if (_scrollBottomBarController.position.userScrollDirection ==
        ScrollDirection.forward)
      setState(() {
        upDirection = false;
      });
    else
      upDirection = true;
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.red.shade900,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'rasan'.tr,
                  style: TextStyle(
                      color: Colors.orange,
                      fontStyle: FontStyle.normal,
                      fontSize: 30),
                ),
                Text(
                  'mart'.tr,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.pink[900],
                  ),
                )
              ],
            )
          : TextFormField(
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white),
              controller: searchController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 10.0),
                  hintText: 'What are you looking for?',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                  fillColor: Colors.grey,
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.white),
                  icon: InkWell(
                      onTap: () {
                        List<Product> search = productController
                            .searchItems(searchController.text);
                        Get.to(
                            SearchResult(
                                searchController: searchController,
                                search: search),
                            transition: Transition.rightToLeft,
                            duration: Duration(seconds: 10));
                      },
                      child: Icon(Icons.search, color: Colors.white)))),
      actions: [
        InkWell(
          onTap: () {
            Get.to(CartPage());
          },
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              size: 25,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Get.to(NotificationsPage());
            },
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(CartPage());
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
              Positioned(
                bottom: 6,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 6,
                  child: Obx(() {
                    return Text(
                      '${cartController.count}',
                      style: AppTheme.subtitle
                          .copyWith(fontSize: 8, color: Colors.grey[700]),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: _scrollBottomBarController,
        child: Obx(
          () => Column(children: [
            networkController.connectionStatus.value == 0
                ? Text('Connect to Internet')
                : Container(),
            if (userController.user == null)
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[900].withOpacity(.8),
                ),
                child: Row(
                  children: [
                    Text(
                      'Your profile is not complete .\nComplete profile by adding your info.',
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(CompleteprofileView());
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    )
                  ],
                ),
              ),
            SearchField(),
            CarouselPro(),
            SizedBox(height: 10),
            Row(children: [
              Text(
                'Categories',
                textAlign: TextAlign.start,
                style: AppTheme.headingStyle,
              ),
            ]),
            SizedBox(height: 20),
            Categories(),
            //CategoriesContainer(productController: productController),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'Top Products',
                  style: AppTheme.headingStyle,
                ),
                SizedBox(height: 20),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'View All',
                    style: AppTheme.subheadingStyle,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            // Container(
            //   height: 300,
            //   width: 250,
            //   color: Colors.green,
            // ),
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
                InkWell(
                  child: Text(
                    'View All',
                    style: AppTheme.subheadingStyle,
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            LatestProductContainer(
                productController: productController,
                cartController: cartController),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
          ]),
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
    double width = sizeUtil.getWidth(context);
    double height = sizeUtil.getheight(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Categories',
        style: headingStyle,
      ),
      SizedBox(height: 10),
      Container(
        color: Colors.white,
        height: height < width
            ? width / 3
            : MediaQuery.of(context).size.height * .34,
        child: GridView.builder(
          //controller: _scrollBottomBarController,
          //padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, int i) {
            return InkWell(
              onTap: () {
                Get.to(
                    CategoriesPage(
                      category[i].categoryName,
                    ),
                    transition: Transition.leftToRight);
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(category[i].categoryImage,
                        fit: BoxFit.fill, height: 45, width: 45),
                    SizedBox(height: 10),
                    Text(
                      category[i].categoryName.toUpperCase(),
                      overflow: TextOverflow.fade,
                      style:
                          subtitleStyle.copyWith(fontWeight: FontWeight.bold),
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
        height: MediaQuery.of(context).size.height * .3,
        child: Carousel(
          dotSize: 0,
          indicatorBgPadding: 0,
          images: [
            NetworkImage(
              'https://www.rasanmart.com/wp-content/uploads/2020/06/101953524_259183725496744_2867387748120002560_n.png',
            ),
            NetworkImage(
                'https://www.rasanmart.com/wp-content/uploads/2020/06/101522295_895508060956667_1800978657359953920_n.png'),
            NetworkImage(
                'https://www.rasanmart.com/wp-content/uploads/2020/04/received_2656387371248213.png'),
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height < width
          ? 300
          : height < width
              ? 150
              : MediaQuery.of(context).size.height * .35,
      child: Obx(() {
        List<Product> prod = productController.topItems();
        return productController.isloading.isFalse
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: prod.length,
                itemBuilder: (_, int i) {
                  return ProductContentHome(
                      height: height, width: width, product: prod[i]);
                },
              )
            : Center(
                child: CircularProgressIndicator(
                strokeWidth: 3,
              ));
      }),
    );
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height < width ? 200 : MediaQuery.of(context).size.height * .35,
        // decoration: BoxDecoration(border: Border.all(width: 1)),
        child: GetX<ProductController>(
            init: ProductController(),
            builder: (controller) {
              return controller.isloading.isFalse
                  ? ListView.builder(
                      itemCount: productController.products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, int i) {
                        DateTime productadded =
                            productController.products[i].dateTime.toDate();
                        var dDay = new DateTime.now();
                        Duration difference = dDay.difference(productadded);

                        if (difference < Duration(days: 99))
                          return ProductContentHome(
                              height: height,
                              width: width,
                              product: productController.products[i]);
                        return Text('');
                      },
                    )
                  // ? GridView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: controller.products.length,
                  //     itemBuilder: (_, int i) {
                  //       DateTime productadded =
                  //           productController.products[i].dateTime.toDate();
                  //       var dDay = new DateTime.now();
                  //       Duration difference = dDay.difference(productadded);

                  //       if (difference < Duration(days: 99))
                  //         return ProductContent(productController.products[i]);
                  //       else
                  //         return null;
                  //     },
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 1,
                  //             mainAxisSpacing: 0,
                  //             crossAxisSpacing: 1
                  //             //  mainAxisExtent: 150.0,
                  //             ),
                  //   )
                  : Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ));
            }));
  }
}

class ProductContentHome extends StatelessWidget {
  const ProductContentHome({
    Key key,
    @required this.height,
    @required this.width,
    @required this.product,
  }) : super(key: key);

  final double height;
  final double width;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(5)
            // gradient: LinearGradient(
            //     colors: [Colors.black, Colors.grey])
            ),
        //  color: Colors.grey,
        //  height: height,
        width: width / 2.4,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(ProductDetail(product));
              },
              child: Stack(alignment: Alignment.topCenter, children: [
                Image.network(product.productImage, height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    product.isSale
                        ? CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.green,
                            child: Text(
                              'Sale',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          )
                        : Text(''),
                    product.discount != 0
                        ? CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red.shade900,
                            child: Text(
                              product.discount.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        : Text(''),
                  ],
                )
              ]),
            ),
            Text(product.productName),
            SizedBox(height: 10),
            Text(
              "Rs. ${product.price.toString()}",
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              //color: Colors.red,
              height: 30,
              child: CartButton(
                product: product,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //color: Colors.grey,
      child: Wrap(children: [
        ...category
            .map((p) => InkWell(
                  onTap: () {
                    Get.to(
                        CategoriesPage(
                          p.categoryName,
                        ),
                        transition: Transition.leftToRight);
                  },
                  child: Container(
                    height: 77,
                    width: 90,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Image.network(
                            p.categoryImage,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          p.categoryName,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList()
      ]),
    );
  }
}
