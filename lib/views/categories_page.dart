import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
            leading: Icon(Icons.remove_red_eye),
            title: Text('View All Products'),trailing: Icon(Icons.arrow_forward_ios),),
        ListTile(leading: Icon(Icons.shopping_basket), title: Text('Glocerry'),trailing: Icon(Icons.arrow_forward_ios),),
        ListTile(leading: Icon(Icons.list_alt), title: Text('Breverage'),trailing: Icon(Icons.arrow_forward_ios),),
        ListTile(leading: Icon(Icons.shopping_basket), title: Text('Branded'),trailing: Icon(Icons.arrow_forward_ios),),
        ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('BabyCare'),
            trailing: Icon(Icons.arrow_forward_ios),),
        ListTile(
          leading: Icon(Icons.shopping_basket),
          title: Text('Personal Care'),
            trailing: Icon(Icons.arrow_forward_ios),),
              ListTile(
          leading: Icon(Icons.shopping_basket),
          title: Text('Household'),
            trailing: Icon(Icons.arrow_forward_ios),),
            
      ],
    );
  }
}
