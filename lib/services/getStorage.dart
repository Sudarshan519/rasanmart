import 'package:get_storage/get_storage.dart';


class LocalGetStorage {
  final box = GetStorage();

  read(String cart) async {
    // List<Product>
    var prod = box.read(cart);

    return prod;
  }

  write(String cart, var a) async {
    await box.write('cart', a);
  }

  // listen(String cart) {
  //   box.listen(() {
  //     print('box changed');
  //   });
  //   // box.removeListen(listen);
  // }

  clear() {
    box.remove('cart');
  }

  // delete() {
  //   box.erase();
  // }
}

LocalGetStorage cartStorage = LocalGetStorage();
