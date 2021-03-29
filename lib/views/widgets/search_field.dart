import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/productController.dart';
import 'package:rasanmart/models/productModel.dart';
import 'package:rasanmart/utils/app_theme.dart';
import 'package:rasanmart/views/widgets/productContent.dart';

class SearchField extends StatelessWidget {
  final searchController = TextEditingController();
  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextFormField(
          controller: searchController,
          onChanged: (v) {
            // List<Product> search =
            //     productController.searchItems(searchController.text);
                
            // Get.to(SearchResult(
            //     searchController: searchController, search: search));
          },
          validator: (v) {
            if (v.isBlank || v.length < 3) return 'Enter value greater than 3';
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(),
            prefixIcon: IconButton(
                icon: Icon(Icons.search),
                color: Colors.pink,
                onPressed: () {
                  // if (searchController.text.isEmpty)
                  //   Get.to(Scaffold(
                  //     body: Center(
                  //       child: Text('Empty'),
                  //     ),
                  //   ));
                  // else {
                  List<Product> search =
                      productController.searchItems(searchController.text);
                  Get.to(SearchResult(
                      searchController: searchController, search: search));
                }
                // showSearch(context: context, delegate: DataSearch(listWords));
                // },
                ),
            hintText: "Search products here",
            hintStyle: TextStyle(fontSize: 15),
          )),
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key key,
    @required this.searchController,
    @required this.search,
  }) : super(key: key);

  final TextEditingController searchController;
  final List<Product> search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () {
              Get.back();
            }),
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: Text(
          "search result on :${searchController.text}",
          style: AppTheme.headingStyle,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          searchController.text.isBlank
              ? Text(
                  'Enter value greater than 3 ',
                  style: AppTheme.title,
                )
              : Text(
                  'Items found ${search.length}',
                  style: AppTheme.title,
                ),
          SizedBox(height: 20),
          Container(
              // color: Colors.green,
              height: 300,
              child: searchController.text.isBlank
                  ? Container()
                  : GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: search.length,
                      itemBuilder: (_, int i) {
                        return ProductContent(search[i]);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 30,
                        mainAxisExtent: 150.0,
                      ),
                    ))
        ],
      ),
    );
  }
}
