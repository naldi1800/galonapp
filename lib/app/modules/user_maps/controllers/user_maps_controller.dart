import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMapsController extends GetxController {
  late TextEditingController addressC;
  late TextEditingController wardC;
  late TextEditingController subdistrictC;
  late TextEditingController regencyC;

  @override
  void onInit() {
    addressC = TextEditingController();
    wardC = TextEditingController();
    subdistrictC = TextEditingController();
    regencyC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    addressC.dispose();
    wardC.dispose();
    subdistrictC.dispose();
    regencyC.dispose();
    super.onClose();
  }
}
