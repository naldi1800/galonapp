import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:galon_app/app/init/Menu.dart';
import 'package:galon_app/app/init/UI.dart';
import 'package:galon_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/admin_list_item_controller.dart';

class AdminListItemView extends GetView<AdminListItemController> {
  const AdminListItemView({Key? key}) : super(key: key);
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
            onPressed: () {
              Get.offAndToNamed(Routes.ADMIN_ADD_ITEM);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: controller.streamList(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState != ConnectionState.waiting) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = data[index].data() as Map<String, dynamic>;
                          // print(item);

                          return ListTile(
                            tileColor: UI.foreground,
                            title: Text(
                              "${item['nama']}",
                              style: TextStyle(color: UI.object),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                controller.delete(data[index].id, item['nama']);
                              },
                            ),
                            onTap: () {
                              controller.toEdit(data[index].id);
                            },
                          );
                        },
                      );
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Menu().admin(),
          ],
        ),
      ),
    );
  }
}
