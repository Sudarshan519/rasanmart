import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
    @required this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item),
        ),
        body: Text('Items'));
  }
}
