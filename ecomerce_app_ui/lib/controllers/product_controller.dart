import 'package:get/get.dart';

class ProductController extends GetxController {
  RxInt checkoutItemCount = 1.obs;

  onCountIncrement() {
    checkoutItemCount(++checkoutItemCount.value);
    print(checkoutItemCount.value);
  }

  onCountDecrement() {
    if (!(checkoutItemCount.value < 0)) {
      checkoutItemCount(--checkoutItemCount.value);
    }
  }
}
