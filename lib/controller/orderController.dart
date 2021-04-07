import 'package:get/get.dart';
import 'package:rasanmart/models/orderModel.dart';
import '../services/firestoreProducts.dart';

class OrderController extends GetxController {
  var isloading = false.obs;
  var orders = List<OrderModelModel>.empty(growable: true).obs;
  var ordermargin = -20.obs;
  var terms = false.obs;
  var id = ''.obs;
  var pay = 'p'.obs;

  @override
  void onInit() {
    super.onInit();
  }

  getOrder() async {
    isloading.toggle();

    List<OrderModelModel> order = await firebaseProduct.getOrder();

    orders = order.obs;
    isloading.toggle();
  }

  void placeOrder(String prod) {
    print('jsonDecode(prod)');
  }
}

// final orderController = Get.put(OrderController());
