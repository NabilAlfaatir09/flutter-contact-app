import 'package:flutter/material.dart';
import 'package:flutter_contact_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.blue,
        elevation: 10,
        shadowColor: Colors.black,
        title: const Text('Contact App'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: controller.cariContact,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Cari Nama Kontak",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx(
                  () => (controller.contacts.isEmpty)
                      ? const Text("Belum ada Daftar Kontak")
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var contacts = controller.contacts[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Color(
                                  (math.Random().nextDouble() * 0xFFFFFF)
                                      .toInt(),
                                ).withOpacity(1.0),
                                child: Icon(
                                  Icons.person,
                                  color: Color(
                                            (math.Random().nextDouble() *
                                                    0xFFFFFF)
                                                .toInt(),
                                          )
                                              .withOpacity(1.0)
                                              .computeLuminance() >
                                          0.5
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                              title: Text(
                                contacts["namaDepan"] +
                                    " " +
                                    contacts["namaBelakang"],
                              ),
                              subtitle: Text(
                                contacts["noTelepon"].toString(),
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
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                title: Text(
                                                    "Yakin Hapus Kontak ${contacts["namaDepan"]}"),
                                                content: Text(
                                                    "Kontak ${contacts["namaDepan"]} akan dihapus dari daftar"),
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
                                                      controller.deleteContact(
                                                          contacts["id"]);
                                                      Navigator.pop(context);
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
                                            });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: controller.contacts.length,
                          separatorBuilder: (context, index) => const Divider(),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.pushNamed(context, Routes.ADD),
        child: const Icon(Icons.add),
      ),
    );
  }
}
