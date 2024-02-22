import 'package:flutter/material.dart';
import 'package:flutter_contact_app/app/data/contact.dart';
import 'package:flutter_contact_app/app/data/database_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController cariContact = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  var contactsUpdate = <Contact>[].obs;
  var sortedContacts = <Contact>[].obs;
  var isAscend = true.obs;

  updateContact(String namaDepan, String namaBelakang, String noTelepon) async {
    final newContact = Contact(
      namaDepan: namaDepan,
      namaBelakang: namaBelakang,
      noTelepon: noTelepon,
    );
    await _databaseHelper.insertContacts(newContact);
    getAllContacts();
  }

  editContact(
      int id, String namaDepan, String namaBelakang, String noTelepon) async {
    final updatedContact = Contact(
      id: id,
      namaDepan: namaDepan,
      namaBelakang: namaBelakang,
      noTelepon: noTelepon,
    );
    await _databaseHelper.updateContacts(updatedContact, id);
    getAllContacts();
  }

  deleteContact(int id) async {
    await _databaseHelper.deleteContacts(id);
    getAllContacts();
  }

  searchContacts(String search) async {
    final result = await _databaseHelper.getAllContacts();
    if (search.isEmpty) {
      contactsUpdate.assignAll(result);
    } else {
      final filteredContacts = result
          .where((contact) =>
              ("${contact.namaDepan.toLowerCase()} ${contact.namaBelakang.toLowerCase()}")
                  .contains(search.toLowerCase()) ||
              contact.namaBelakang
                  .toLowerCase()
                  .contains(search.toLowerCase()) ||
              contact.noTelepon.toLowerCase().contains(search.toLowerCase()))
          .toList();
      contactsUpdate.assignAll(filteredContacts);
    }
  }

  sortNama() {
    List<Contact> sortedList = contactsUpdate.toList();
    if (isAscend.value) {
      sortedList.sort((a, b) =>
          a.namaDepan.toLowerCase().compareTo(b.namaDepan.toLowerCase()));
    } else {
      sortedList.sort((a, b) =>
          b.namaDepan.toLowerCase().compareTo(a.namaDepan.toLowerCase()));
    }
    isAscend.value = !isAscend.value;
    sortedContacts.assignAll(sortedList);
    contactsUpdate.assignAll(sortedContacts);
  }

  getAllContacts() async {
    final result = await _databaseHelper.getAllContacts();
    contactsUpdate.assignAll(result);
  }

  @override
  void onInit() {
    getAllContacts();
    super.onInit();
  }
}
