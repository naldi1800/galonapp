import 'package:flutter/material.dart';
import 'package:galon_app/app/controller/AuthController.dart';
import 'package:galon_app/app/init/UI.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 15),
                  Container(
                    padding: padding,
                    width: double.infinity,
                    color: UI.foreground,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        Text(
                          "Galon Aja",
                          style: TextStyle(
                            color: UI.object,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Selamat Datang",
                          style: TextStyle(
                            color: UI.object,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Pesan sekarang antar sekarang",
                          style: TextStyle(
                            color: UI.object,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: padding,
                    child: Text(
                      "List Menu",
                      style: TextStyle(
                        color: UI.object,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Container(
                      padding: padding,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return galonItem(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
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
                    menuItem(icon: Icons.shopping_bag, text: "Cart"),
                    menuItem(icon: Icons.shopping_cart, text: "Orders"),
                    menuItem(icon: Icons.person, text: "Profile"),
                    menuItem(icon: Icons.logout, text: "Logout"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget galonItem(int index) {
    String text = "";
    String url = "";
    switch (index) {
      case 0:
        {
          text = "Order Galon";
          url = "https://www.pngarts.com/files/3/Water-Bottle-PNG-Photo.png";
        }
        break;
      case 1:
        {
          text = "Club";
          url =
              "https://siplahtelkom.com/public/products/154398/2634150/club-galon-19-l.1624512761.jpg";
        }
        break;
      case 2:
        {
          text = "Cleo";
          url =
              "https://koperasibh.files.wordpress.com/2016/10/3-cleo-galon.png";
        }
        break;
      case 3:
        {
          text = "VIT";
          url = "https://upload.wikimedia.org/wikipedia/id/8/8b/VIT.png";
        }
        break;
      case 4:
        {
          text = "Aqua";
          url =
              "https://static-siplah.blibli.com/data/images/SAJA-0078-00351/8926d00d-617d-46c8-a3dc-efbbd14cefdd.jpg";
        }
        break;
    }
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5,
                blurRadius: 5,
                // offset: Offset.fromDirection(-15, -53),
              ),
            ],
          ),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(url),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            color: UI.object,
            fontSize: 12,
          ),
        )
      ],
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
        onTap: () {
          if (text == "Logout") {
            controller.auth.logout();
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
