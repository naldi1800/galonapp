import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:galon_app/app/init/UI.dart';
import 'package:galon_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AdminEditItemController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController ukuranC;
  late TextEditingController hargaC;
  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getData(docID) {
    CollectionReference item = fire.collection('Items');
    return item.doc(docID).get();
  }

  void edit(
    docID,
    String nama,
    String ukuran,
    String harga,
  ) async {
    CollectionReference item = fire.collection("Items");

    // DateTime d = DateTime.parse("");
    await item.doc(docID).update({
      "nama": nama,
      "ukuran": int.parse(ukuran),
      "harga": int.parse(harga),
    });
    // await item.add({
    //   "nama": nama,
    //   "ukuran": ukuran,
    //   "harga": harga,
    // });

    Get.defaultDialog(
      title: "Success",
      middleText: "Success for change new item",
      backgroundColor: UI.foreground,
      titleStyle: TextStyle(color: UI.object),
      middleTextStyle: TextStyle(color: UI.object),
      onConfirm: () {
        nameC.clear();
        ukuranC.clear();
        hargaC.clear();
        Get.back();
        Get.offAndToNamed(Routes.ADMIN_LIST_ITEM);
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
