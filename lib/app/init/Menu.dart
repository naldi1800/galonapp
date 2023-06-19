import 'package:galon_app/app/controller/AuthController.dart';
import 'package:galon_app/app/init/UI.dart';
import 'package:galon_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu {
  AuthController auth = Get.find<AuthController>();
  Widget admin() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 75,
        color: UI.foreground,
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            menuItem(icon: Icons.home, text: "Home"),
            menuItem(icon: Icons.list, text: "Galon"),
            menuItem(icon: CupertinoIcons.money_dollar, text: "Orders"),
            menuItem(icon: Icons.delivery_dining, text: "Delivery"),
            menuItem(icon: Icons.logout, text: "Logout"),
          ],
        ),
      ),
    );
  }

  Container menuItem({required IconData icon, required String text}) {
    return Container(
      child: GestureDetector(
        onTap: () {
          if (text == "Logout") {
            auth.logout();
          } else if (text == "Galon") {
            Get.offAndToNamed(Routes.ADMIN_LIST_ITEM);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: UI.action,
            ),
            Text(
              text,
              style: TextStyle(
                color: UI.action,
              ),
            )
          ],
        ),
      ),
    );
  }
}
