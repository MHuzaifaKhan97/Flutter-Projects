import 'package:get/get.dart';

class WelcomeController extends GetxController {
  RxBool isRemeber = false.obs;

  changeIsRemember(bool value) {
    isRemeber(value);
  }
}
