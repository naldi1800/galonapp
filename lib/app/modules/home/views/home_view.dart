import 'package:flutter/material.dart';
import 'package:galon_app/app/controller/AuthController.dart';
import 'package:galon_app/app/init/UI.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find<AuthController>();
    // print(auth.auth.currentUser);
    // var isVerify = auth.auth.currentUser!.emailVerified;
    // if (!isVerify) {
    //   Get.defaultDialog(
    //     title: "Warning!!!",
    //     middleText: "Your email is not verify",
    //     confirm: Text("Send verify email"),
    //     onConfirm: () =>  auth.sendVerifyEmail(),
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home User'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => auth.logout(),
          )
        ],
      ),
      backgroundColor: UI.background,
      body: const SafeArea(
        child: Center(
          child: Text("Ini Halaman User"),
        ),
      ),
    );
  }
}
