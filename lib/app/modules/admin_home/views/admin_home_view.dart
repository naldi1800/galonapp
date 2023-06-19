import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galon_app/app/init/Menu.dart';
import 'package:galon_app/app/init/UI.dart';

import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // AuthController auth = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: UI.background,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              child: Column(
                children: [Text("Home")],
              ),
            ),
            Menu().admin(),
          ],
        ),
      ),
    );
  }
}
