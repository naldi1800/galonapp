import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController cSearch;

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
