import 'package:flutter/material.dart';

class SizeUtils {
  getheight(context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return queryData.size.height;
  }

  getWidth(context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return queryData.size.width;
  }
}

final sizeUtil = SizeUtils();

