import 'package:flutter/material.dart';
import 'package:galon_app/app/controller/AuthController.dart';
import 'package:galon_app/app/init/UI.dart';

import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: UI.background,
      appBar: AppBar(
        title: const Text('Home Admin'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => auth.logout(),
          )
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Ini Halaman Admin"),
        ),
      ),
      // body: SafeArea(
      //   child: Stack(
      //     children: [
      //       Container(),
      //       //Menu
      //       Container(
      //         alignment: Alignment.bottomCenter,
      //         width: double.infinity,
      //         height: 150,
      //         color: UI.foreground,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
