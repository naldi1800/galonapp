import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:galon_app/app/controller/AuthController.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(mainClass());
}

class mainClass extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.authStreamStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: "Application",
            initialRoute:
                snapshot.data != null ? Routes.ADMIN_HOME : Routes.LOGIN,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
