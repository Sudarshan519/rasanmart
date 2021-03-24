import 'package:get_storage/get_storage.dart';

import '../models/productModel.dart';

class LocalGetStorage {
  final box = GetStorage();

  read(String cart) async {
    // List<Product>
    String prod = box.read(cart);
    // print(prod);
    return prod;
  }

  write(String cart, String a) async {
    await box.write('cart', a);
  }

  // listen(String cart) {
  //   box.listen(() {
  //     print('box changed');
  //   });
  //   // box.removeListen(listen);
  // }

  // remove(String storage) {
  //   box.remove('quote');
  // }

  // delete() {
  //   box.erase();
  // }
}

LocalGetStorage cartStorage = LocalGetStorage();
