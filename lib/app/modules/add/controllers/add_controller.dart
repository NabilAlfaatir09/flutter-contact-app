import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  var key = GlobalKey<FormState>();
  TextEditingController namaDepan = TextEditingController();
  TextEditingController namaBelakang = TextEditingController();
  TextEditingController noTelepon = TextEditingController();

  cekNama(String value) {
    if (value == "") {
      return "Nama tidak boleh kosong";
    }
  }

  cekNomor(String value) {
    if (value == "") {
      return "Nomor tidak boleh kosong";
    }
  }

  successValidate() {
    namaDepan.text = "";
    namaBelakang.text = "";
    noTelepon.text = "";
    Get.snackbar("Success", "Kontak berhasil ditambahkan");
  }
}
