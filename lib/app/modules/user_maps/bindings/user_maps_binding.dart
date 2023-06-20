import 'package:get/get.dart';

import '../controllers/user_maps_controller.dart';

class UserMapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserMapsController>(
      () => UserMapsController(),
    );
  }
}
