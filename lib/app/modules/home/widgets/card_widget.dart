import 'package:flutter/material.dart';
import 'package:flutter_contact_app/app/data/contact.dart';
import 'package:flutter_contact_app/app/modules/home/controllers/home_controller.dart';
import 'dart:math' as math;

import 'package:flutter_contact_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Card cardWidget(BuildContext context, Contact contacts) {
  final controller = Get.put(HomeController());
  return Card(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Color(
              (math.Random().nextDouble() * 0xFFFFFF).toInt(),
            ).withOpacity(1.0),
            child: Icon(
              Icons.person,
              color: Color(
                        (math.Random().nextDouble() * 0xFFFFFF).toInt(),
                      ).withOpacity(1.0).computeLuminance() >
                      0.5
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          title: Text(
            "${contacts.namaDepan} ${contacts.namaBelakang}",
          ),
          subtitle: Text(
            contacts.noTelepon.toString(),
          ),
          trailing: FittedBox(
            fit: BoxFit.fill,
            child: Row(
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.EDIT,
                      arguments: contacts,
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.blue,
                          title:
                              Text("Yakin Hapus Kontak ${contacts.namaDepan}"),
                          content: Text(
                              "Kontak ${contacts.namaDepan} akan dihapus dari daftar"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "NO",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.deleteContact(contacts.id!);
                                Navigator.pop(context);
                                showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.blue,
                                      title:
                                          const Text("Kontak berhasil dihapus"),
                                      content: Lottie.asset(
                                          "assets/checklist.json",
                                          width: 200,
                                          height: 200),
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                "YES",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
