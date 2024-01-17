import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  var key = GlobalKey<FormState>();

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
