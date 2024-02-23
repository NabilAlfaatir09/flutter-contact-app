import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  var key = GlobalKey<FormState>();
  TextEditingController namaDepan = TextEditingController();
  TextEditingController namaBelakang = TextEditingController();
  TextEditingController noTelepon = TextEditingController();

  cekNama(String value) {
    if (value.isEmpty) {
      return "Nama tidak boleh kosong";
    }
  }

  cekNomor(String value) {
    RegExp regex = RegExp(r'^(\+62|62|0)8[1-9][0-9]{6,9}$');
    if (value.isEmpty) {
      return "Nomor tidak boleh kosong";
    } else if (value.length < 12) {
      return "Nomor harus terdiri dari 12 angka atau lebih";
    } else if (!regex.hasMatch(value)) {
      return "Nomor tidak valid, gunakan nomor Indonesia";
    }
  }

  successValidate() {
    namaDepan.text = "";
    namaBelakang.text = "";
    noTelepon.text = "";
  }
}
