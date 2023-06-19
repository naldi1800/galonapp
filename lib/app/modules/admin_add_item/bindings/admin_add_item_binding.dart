import 'package:get/get.dart';

import '../controllers/admin_add_item_controller.dart';

class AdminAddItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAddItemController>(
      () => AdminAddItemController(),
    );
  }
}
