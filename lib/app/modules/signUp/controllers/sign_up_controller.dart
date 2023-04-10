import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController cName;
  late TextEditingController cEmail;
  late TextEditingController cPassword;
  late TextEditingController cRePassword;
  var showPass = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cName = TextEditingController(text: "Maura");
    cEmail = TextEditingController(text: "mauralestaluhu30@gmail.com");
    cPassword = TextEditingController(text: "123456");
    cRePassword = TextEditingController(text: "123456");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    cName.dispose();
    cEmail.dispose();
    cPassword.dispose();
    cRePassword.dispose();
  }
}
