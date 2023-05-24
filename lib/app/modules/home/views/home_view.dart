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
        title: const Text('Galonku'),
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: const Icon(Icons.logout),
          //   onPressed: () => auth.logout(),
          // )
        ],
      ),
      backgroundColor: UI.background,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: controller.cSearch,
                    style: TextStyle(color: UI.object, fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: UI.foreground),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Search . . .",
                      filled: true,
                      fillColor: UI.foreground,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return item(
                          name: "Item $index",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 75,
                color: UI.background,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    menuItem(icon: Icons.home, text: "Home"),
                    menuItem(icon: Icons.shopping_bag, text: "Cart"),
                    menuItem(icon: Icons.shopping_cart, text: "Orders"),
                    menuItem(icon: Icons.person, text: "Profile")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container item({required String name}) {
    return Container(
      // padding: EdgeInsets.all(10),
      width: 100,
      height: 100,
      color: Colors.yellow,
      child: Text(
        name,
        style: TextStyle(fontSize: 35),
      ),
    );
  }

  Container menuItem({required IconData icon, required String text}) {
    return Container(
      child: GestureDetector(
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
