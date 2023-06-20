import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:galon_app/app/controller/AuthController.dart';
import 'package:galon_app/app/init/UI.dart';
import 'package:galon_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AdminListItemController extends GetxController {
  AuthController auth = Get.find<AuthController>();
  FirebaseFirestore fire = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamList() {
    Stream<QuerySnapshot> listItem = fire.collection('Items').snapshots();
    return listItem;
  }

  void toEdit(docID) {
    Get.offAndToNamed(Routes.ADMIN_EDIT_ITEM, arguments: docID);
  }

  void delete(String docID, String name) {
    DocumentReference doc = fire.collection('Items').doc(docID);
    try {
      Get.defaultDialog(
        title: "Delete",
        middleText: "Are you sure to delete this data '$name'",
        onConfirm: () async {
          await doc.delete();
          Get.back();
        },
        backgroundColor: UI.foreground,
        confirmTextColor: UI.object,
        titleStyle: TextStyle(color: UI.object),
        middleTextStyle: TextStyle(color: UI.object),
        textConfirm: "Yes",
        textCancel: "No",
      );
    } catch (e) {
      print(e);
    }
  }
}
