import 'package:flutter/material.dart';
import 'package:galon_app/app/init/Menu.dart';
import 'package:galon_app/app/init/UI.dart';

import 'package:get/get.dart';

import '../controllers/admin_edit_item_controller.dart';

class AdminEditItemView extends GetView<AdminEditItemController> {
  const AdminEditItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UI.background,
      appBar: AppBar(
        backgroundColor: UI.action,
        title: Text(
          "Data Galon",
          style: TextStyle(
            color: UI.object,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder(
                  future: controller.getData(Get.arguments),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        var data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        print(data);
                        controller.nameC.text = data['nama'].toString();
                        controller.hargaC.text = data['harga'].toString();
                        controller.ukuranC.text = data['ukuran'].toString();

                        return Column(
                          children: [
                            TextField(
                              controller: controller.nameC,
                              style: TextStyle(color: UI.object),
                              decoration: InputDecoration(
                                hintText: 'Input Nama',
                                label: const Text('Nama'),
                                labelStyle:
                                    TextStyle(fontSize: 15, color: UI.action),
                                hintStyle:
                                    TextStyle(fontSize: 15, color: UI.object),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: controller.ukuranC,
                              style: TextStyle(color: UI.object),
                              decoration: InputDecoration(
                                hintText: 'Input Ukuran',
                                label: const Text('Ukuran'),
                                labelStyle:
                                    TextStyle(fontSize: 15, color: UI.action),
                                hintStyle:
                                    TextStyle(fontSize: 15, color: UI.object),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: controller.hargaC,
                              style: TextStyle(color: UI.object),
                              decoration: InputDecoration(
                                hintText: 'Input Harga',
                                label: const Text('Harga'),
                                labelStyle:
                                    TextStyle(fontSize: 15, color: UI.action),
                                hintStyle:
                                    TextStyle(fontSize: 15, color: UI.object),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(UI.action)),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: UI.object, fontFamily: 'arvo'),
                              ),
                              // onPressed: () => controller.tes(),
                              onPressed: () => controller.edit(
                                Get.arguments,
                                controller.nameC.text,
                                controller.ukuranC.text,
                                controller.hargaC.text,
                              ),
                            ),
                          ],
                        );
                      }
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ),
            Menu().admin(),
          ],
        ),
      ),
    );
  }
}
