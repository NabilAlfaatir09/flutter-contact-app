import 'package:flutter/material.dart';
import 'package:flutter_contact_app/app/data/contact.dart';
import 'package:flutter_contact_app/app/data/database_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController cariContact = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  var contactsUpdate = [].obs;

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
              ("${contact.namaDepan!.toLowerCase()} ${contact.namaBelakang!.toLowerCase()}")
                  .contains(search.toLowerCase()) ||
              contact.namaBelakang!
                  .toLowerCase()
                  .contains(search.toLowerCase()) ||
              contact.noTelepon!.toLowerCase().contains(search.toLowerCase()))
          .toList();
      contactsUpdate.assignAll(filteredContacts);
    }
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
