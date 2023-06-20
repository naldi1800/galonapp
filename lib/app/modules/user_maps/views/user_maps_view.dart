import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_maps_controller.dart';

class UserMapsView extends GetView<UserMapsController> {
  const UserMapsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserMapsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UserMapsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
