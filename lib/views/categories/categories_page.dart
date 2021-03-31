import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/models/productModel.dart';

class CategoriesPage extends StatefulWidget {
  final String categoryName;
  final List<Product> prod;
  CategoriesPage(
    this.categoryName,
    this.prod,
  );

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  //   cagegoryItems(String category) {
  //   List<Product> prod = [];
  //   products.forEach((element) {
  //     products.forEach((element) {
  //       if (element.category.toLowerCase().contains(category.toLowerCase())) {
  //         prod.add(element);
  //       }
  //     });
  //   });
  //   return prod;
  // }
  //  getSearch() async {
  //   var product = await controller.cagegoryItems(widget.categoryName);
  //    setState(() {
  //      prod=product;
  //    });
  // }List<Product> prod =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [Text(widget.categoryName)],
        ),
      ),
      body: ListView.builder(
        itemCount: widget.prod.length,
        itemBuilder: (_, int i) {
          return Text(widget.prod[i].productName);
        },

        //children: [
        // ListTile(
        //   onTap: () {
        //     setState(() {
        //       isExpanded = !isExpanded;
        //     });
        //   },
        //   leading: Icon(Icons.remove_red_eye),
        //   title: Text('View All Products'),
        //   trailing: isExpanded
        //       ? Icon(Icons.arrow_forward_ios)
        //       : Transform(
        //           transform: new Matrix4.identity()
        //             ..rotateZ(90 * 3.1415927 / 180),
        //           child: Icon(Icons.arrow_forward_ios)),
        // ),
        // if (!isExpanded)
        //   Container(
        //     child: Text('Items'),
        //   ),
        // ListTile(
        //   leading: Icon(Icons.shopping_basket),
        //   title: Text('Glocerry'),
        //   trailing: Icon(Icons.arrow_forward_ios),
        // ),
        // ListTile(
        //   leading: Icon(Icons.list_alt),
        //   title: Text('Breverage'),
        //   trailing: Icon(Icons.arrow_forward_ios),
        // ),
        // ListTile(
        //   leading: Icon(Icons.shopping_basket),
        //   title: Text('Branded'),
        //   trailing: Icon(Icons.arrow_forward_ios),
        // ),
        // ListTile(
        //   leading: Icon(Icons.shopping_basket),
        //   title: Text('BabyCare'),
        //   trailing: Icon(Icons.arrow_forward_ios),
        // ),
        // ListTile(
        //   leading: Icon(Icons.shopping_basket),
        //   title: Text('Personal Care'),
        //   trailing: Icon(Icons.arrow_forward_ios),
        // ),
        // ListTile(
        //   leading: Icon(Icons.shopping_basket),
        //   title: Text('Household'),
        //   trailing: Icon(Icons.arrow_forward_ios),
        // ),
        //  ],
      ),
    );
  }
}
