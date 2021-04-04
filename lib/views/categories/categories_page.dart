import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/productController.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/services/firestoreProducts.dart';
import 'package:rasanmart/views/widgets/productContent.dart';

class CategoriesPage extends StatefulWidget {
  final String categoryName;
  CategoriesPage(
    this.categoryName,
  );

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final productController = Get.find<ProductController>();

  List<Product> prod;
  fetchProd() async {
    List<Product> all =
        await firebaseProduct.searchProduct(widget.categoryName);
    setState(() {
      prod = all;
    });
  }

  @override
  void initState() {
    fetchProd();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.white)),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Column(
          children: [
            Text(widget.categoryName,
                style: TextStyle(color: Theme.of(context).primaryColor))
          ],
        ),
      ),
      body: prod == null
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ))
          : prod.length == 0
              ? Center(
                  child: Text('No items found'),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                  ),
                  shrinkWrap: true,
                  itemCount: prod.length,
                  itemBuilder: (_, int i) {
                    return ProductContent(prod[i]);
                  },
                ),
    );
  }
}
