import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/cartController.dart';
import 'package:rasanmart/controller/networkController.dart';
import 'package:rasanmart/controller/productController.dart';
import 'package:rasanmart/models/category_model.dart';
import 'package:rasanmart/models/productModel.dart';
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
  final searchController = TextEditingController();
  ScrollController _scrollBottomBarController = new ScrollController();
  bool _show;
  bool upDirection = true;
  @override
  void initState() {
    super.initState();

    _show = false;
    _scrollBottomBarController.removeListener(() {});
    myScroll();
    //checkScroll();
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
      // centerTitle: true,
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
                  'Rasan',
                  style: TextStyle(
                      color: Colors.orange,
                      fontStyle: FontStyle.normal,
                      fontSize: 30),
                ),
                Text(
                  'Mart',
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
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  hintText: 'What are you looking for?',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.grey,
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: InkWell(
                      onTap: () {
                        List<Product> search = productController
                            .searchItems(searchController.text);
                        Get.to(SearchResult(
                            searchController: searchController,
                            search: search));
                      },
                      child: Icon(Icons.search, color: Colors.white)))),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
        IconButton(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 25,
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
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SafeArea(
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
            SizedBox(height: 15),
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
                    // Get.to(
                    //   Categories(item: item),
                    // );
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
                cartController: cartController)
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Categories',
        style: headingStyle,
      ),
      SizedBox(height: 10),
      Container(
        color: Colors.white,
        height: 200,
        child: GridView.builder(
          padding: EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 10),
          itemBuilder: (context, int i) {
            return InkWell(
              onTap: () {
                Get.to(CategoriesPage(
                  category[i].categoryName,
                ));
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(category[i].categoryImage,
                        fit: BoxFit.fill, height: 55, width: 55),
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
        color: Colors.red,
        height: 200.0,
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
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      child: Obx(()  {
        List<Product> prod= productController.topItems();
        return productController.isloading.isFalse
            //    (productController.products[i].totalFavourite > 100)
            ? GridView.builder(
                //padding: EdgeInsets.symmetric( horizontal:10),
                scrollDirection: Axis.horizontal,
                itemCount:prod.length,
                itemBuilder: (_, int i) {
                  return ProductContent(prod[i]);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  //  mainAxisSpacing: 30,
                  mainAxisExtent: 150.0,
                ),
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
    return Container(
        height: MediaQuery.of(context).size.height * .3,
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
                        DateTime productadded =
                            productController.products[i].dateTime.toDate();
                        var dDay = new DateTime.now();
                        Duration difference = dDay.difference(productadded);

                        if (difference < Duration(days: 99))
                          return ProductContent(productController.products[i]);
                        else
                          return null;
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        //  mainAxisSpacing: 30,
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
