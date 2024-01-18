import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController cariContact = TextEditingController();
  int id = 1;
  var contacts = [].obs;
  var contactsUpdate = [].obs;

  updateContact(String namaDepan, String namaBelakang, String noTelepon) {
    Map<String, dynamic> contactAdd = {
      "id": id,
      "namaDepan": namaDepan,
      "namaBelakang": namaBelakang,
      "noTelepon": noTelepon,
    };
    contacts.add(contactAdd);
    id++;
    contactsUpdate.assignAll(contacts);
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
      contactsUpdate.assignAll(contacts);
    }
  }

  deleteContact(int id) {
    contacts.removeWhere((contact) => contact["id"] == id);
    contactsUpdate.assignAll(contacts);
  }

  searchContacts(String search) {
    List result = [];
    if (search.isEmpty) {
      result = contacts;
    } else {
      result = contacts
          .where(
            (element) =>
                (element["namaDepan"] + " " + element["namaBelakang"])
                    .toLowerCase()
                    .contains(
                      search.toLowerCase(),
                    ) ||
                element["namaBelakang"].toLowerCase().contains(
                      search.toLowerCase(),
                    ) ||
                element["noTelepon"].toLowerCase().contains(
                      search.toLowerCase(),
                    ),
          )
          .toList();
    }
    contactsUpdate.assignAll(result);
  }

  @override
  void onInit() {
    contactsUpdate.assignAll(contacts);
    super.onInit();
  }
}
