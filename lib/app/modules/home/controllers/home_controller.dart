import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController cariContact = TextEditingController();
  int id = 1;
  var contacts = [].obs;

  updateContact(String namaDepan, String namaBelakang, String noTelepon) {
    Map<String, dynamic> contactAdd = {
      "id": id,
      "namaDepan": namaDepan,
      "namaBelakang": namaBelakang,
      "noTelepon": noTelepon,
    };
    contacts.add(contactAdd);
    id++;
  }

  editContact(int id, String namaDepan, String namaBelakang, String noTelepon) {
    int index = contacts.indexWhere((contact) => contact["id"] == id);
    if (index != -1) {
      contacts[index] = {
        "id": id,
        "namaDepan": namaDepan,
        "namaBelakang": namaBelakang,
        "noTelepon": noTelepon,
      };
    }
  }

  deleteContact(int id) {
    contacts.removeWhere((contact) => contact["id"] == id);
  }
}
