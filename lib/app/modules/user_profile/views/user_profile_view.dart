import 'package:flutter/material.dart';
import 'package:galon_app/app/init/Menu.dart';
import 'package:galon_app/app/init/UI.dart';

import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = const EdgeInsets.only(
      left: 20,
      right: 20,
    );
    return Scaffold(
      backgroundColor: UI.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: padding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Image.network("https://picsum.photos/200/300"),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "NAMA SAYA ADALAH INI",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: UI.object,
                                ),
                              ),
                              Text(
                                "POIN : 100",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: UI.object,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map_sharp,
                          color: UI.action,
                        ),
                        Text(
                          "Alamat saya",
                          style: TextStyle(fontSize: 15, color: UI.object),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Menu().user(),
          ],
        ),
      ),
    );
  }
}
