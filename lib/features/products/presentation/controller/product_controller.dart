import 'package:get/get.dart';

class ProductsController extends GetxController {
  var filterController = '';
  void changeFilterControllerValue(String rate) {
    filterController = rate;
    update();
  }
}
