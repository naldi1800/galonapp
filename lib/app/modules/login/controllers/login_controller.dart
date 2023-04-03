import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController cUser =
      TextEditingController(text: "maura.galon.23@gmail.com");
  TextEditingController cPass = TextEditingController(text: "201008");
  var showPass = true.obs;
}
