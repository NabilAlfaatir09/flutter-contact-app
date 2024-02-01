import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contact_app/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var homeControll = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Tambah Kontak'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.key,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: controller.namaDepan,
              validator: (value) => controller.cekNama(value.toString()),
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                label: const Text("Nama Depan"),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.namaBelakang,
              validator: (value) => controller.cekNama(value.toString()),
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                label: const Text("Nama Belakang"),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.noTelepon,
              validator: (value) => controller.cekNomor(value.toString()),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                label: const Text("No Telepon"),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                if (controller.key.currentState!.validate()) {
                  homeControll.updateContact(
                    controller.namaDepan.text,
                    controller.namaBelakang.text,
                    controller.noTelepon.text,
                  );
                  controller.successValidate();
                  Navigator.pop(context);
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.blue,
                        title: const Text("Kontak berhasil ditambah"),
                        content: Lottie.asset("assets/checklist.json",
                            width: 200, height: 200),
                      );
                    },
                  );
                }
              },
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Tambah Kontak",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
