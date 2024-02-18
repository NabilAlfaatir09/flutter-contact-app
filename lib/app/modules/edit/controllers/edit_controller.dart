import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  var key = GlobalKey<FormState>();
  final TextEditingController namaDepan;
  final TextEditingController namaBelakang;
  final TextEditingController noTelepon;

  EditController()
      : namaDepan = TextEditingController(text: Get.arguments.namaDepan),
        namaBelakang = TextEditingController(text: Get.arguments.namaBelakang),
        noTelepon = TextEditingController(text: Get.arguments.noTelepon) {
    namaDepan.selection =
        TextSelection.collapsed(offset: namaDepan.text.length);
    namaBelakang.selection =
        TextSelection.collapsed(offset: namaBelakang.text.length);
    noTelepon.selection =
        TextSelection.collapsed(offset: noTelepon.text.length);
  }

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
}
