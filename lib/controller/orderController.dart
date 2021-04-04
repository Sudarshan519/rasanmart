
import 'package:get/get.dart';

class OrderController extends GetxController {
  var isloading = false.obs;
var pay='p'.obs;
  setloading(value) {
    isloading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    // isloading.value = false;
  }

  // void changeValue() {
  //   isloading = isloading.toggle();
  // }

  void placeOrder(String prod) {
    print('jsonDecode(prod)');
    //orderService.placeOrder(prod);
  }
}

// import 'package:get/get.dart';

// class MyController extends GetxController {

// final MyRepository repository;
// MyController({@required this.repository}) : assert(repository != null);

//   final _obj = ''.obs;
//   set obj(value) => this._obj.value = value;
//   get obj => this._obj.value;
// }

final orderController=Get.put(OrderController());