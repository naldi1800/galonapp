import 'package:get/get.dart';

import '../controllers/admin_list_item_controller.dart';

class AdminListItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminListItemController>(
      () => AdminListItemController(),
    );
  }
}
