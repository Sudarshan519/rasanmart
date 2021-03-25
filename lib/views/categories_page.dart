import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            leading: Icon(Icons.remove_red_eye),
            title: Text('View All Products'),
            trailing: isExpanded
                ? Icon(Icons.arrow_forward_ios)
                : Transform(
                    transform: new Matrix4.identity()
                      ..rotateZ(90 * 3.1415927 / 180),
                    child: Icon(Icons.arrow_forward_ios)),
          ),
          if (!isExpanded)
            Container(
              child: Text('Items'),
            ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Glocerry'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text('Breverage'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Branded'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('BabyCare'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Personal Care'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Household'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
