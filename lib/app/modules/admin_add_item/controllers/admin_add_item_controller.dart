import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:galon_app/app/init/UI.dart';
import 'package:get/get.dart';

class AdminAddItemController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController ukuranC;
  late TextEditingController hargaC;
  FirebaseFirestore fire = FirebaseFirestore.instance;

  void add(
    String nama,
    String ukuran,
    String harga,
  ) async {
    CollectionReference costumers = fire.collection("Items");

    // DateTime d = DateTime.parse("");
    await costumers.add({
      "nama": nama,
      "ukuran": ukuran,
      "harga": harga,
    });

    Get.defaultDialog(
      title: "Success",
      middleText: "Success for adding new item",
      backgroundColor: UI.foreground,
      titleStyle: TextStyle(color: UI.object),
      middleTextStyle: TextStyle(color: UI.object),
      onConfirm: () {
        nameC.clear();
        ukuranC.clear();
        hargaC.clear();
        Get.back();
        Get.back();
      },
      textConfirm: "Ok",
    );
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    ukuranC = TextEditingController();
    hargaC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    ukuranC.dispose();
    hargaC.dispose();
    super.onClose();
  }
}
