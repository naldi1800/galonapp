import 'package:get/get.dart';

import '../controllers/admin_edit_item_controller.dart';

class AdminEditItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminEditItemController>(
      () => AdminEditItemController(),
    );
  }
}
