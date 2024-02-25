import 'package:flutter/material.dart';
import 'package:flutter_contact_app/app/modules/home/controllers/home_controller.dart';

class SearchWidget extends StatelessWidget {
  final HomeController controller;
  const SearchWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        controller: controller.cariContact,
        onChanged: (value) => controller.searchContacts(value),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blue,
          ),
          border: InputBorder.none,
          hintText: "Cari Nama Kontak",
        ),
      ),
    );
  }
}
