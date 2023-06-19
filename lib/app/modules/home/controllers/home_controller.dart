import 'package:flutter/cupertino.dart';
import 'package:galon_app/app/controller/AuthController.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController cSearch;
  AuthController auth = Get.find<AuthController>();
  @override
  void onInit() {
    super.onInit();
    cSearch = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    cSearch.dispose();
  }
}
