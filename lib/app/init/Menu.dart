// ignore_for_file: void_checks

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
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            menuItem(
              icon: Icons.home,
              text: "Home",
              onTap: () => Get.offAndToNamed(Routes.ADMIN_HOME),
            ),
            menuItem(
              icon: Icons.list,
              text: "Galon",
              onTap: () => Get.offAndToNamed(Routes.ADMIN_LIST_ITEM),
            ),
            menuItem(
              icon: CupertinoIcons.money_dollar,
              text: "Orders",
              onTap: () => Get.offAndToNamed(Routes.ADMIN_HOME),
            ),
            menuItem(
              icon: Icons.delivery_dining,
              text: "Delivery",
              onTap: () => Get.offAndToNamed(Routes.ADMIN_HOME),
            ),
            menuItem(
              icon: Icons.logout,
              text: "Logout",
              onTap: () => auth.logout(),
            ),
          ],
        ),
      ),
    );
  }

  Widget user() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 75,
        color: UI.foreground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            menuItem(
              icon: Icons.home,
              text: "Home",
              onTap: () => Get.offAndToNamed(Routes.HOME),
            ),
            menuItem(
              icon: Icons.shopping_bag,
              text: "Cart",
              onTap: () => Get.offAndToNamed(Routes.HOME),
            ),
            menuItem(
              icon: Icons.shopping_cart,
              text: "Orders",
              onTap: () => Get.offAndToNamed(Routes.HOME),
            ),
            menuItem(
              icon: Icons.person,
              text: "Profile",
              onTap: () => Get.offAndToNamed(Routes.USER_PROFILE),
            ),
            menuItem(
              icon: Icons.logout,
              text: "Logout",
              onTap: () => auth.logout(),
            ),
          ],
        ),
      ),
    );
  }

  Container menuItem(
      {required IconData icon, required String text, required void onTap}) {
    return Container(
      child: GestureDetector(
        onTap: () => onTap,
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
