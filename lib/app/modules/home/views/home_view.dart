import 'package:flutter/material.dart';
import 'package:flutter_contact_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
            child: Obx(
              () => (controller.contactsUpdate.isEmpty)
                  ? Column(
                      children: [
                        Lottie.asset(
                          "assets/datanotfound.json",
                          height: 300,
                          width: 300,
                        ),
                        const Text("Belum ada Daftar Kontak"),
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
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
                            onChanged: (value) =>
                                controller.searchContacts(value),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.blue,
                              ),
                              border: InputBorder.none,
                              hintText: "Cari Nama Kontak",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => controller.sortNama(),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.sort,
                                size: 35,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Sort",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var contacts = controller.contactsUpdate[index];
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
                                                borderRadius:
                                                    BorderRadius.circular(5),
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
                                                    backgroundColor:
                                                        Colors.blue,
                                                    title: Text(
                                                        "Yakin Hapus Kontak ${contacts.namaDepan}"),
                                                    content: Text(
                                                        "Kontak ${contacts.namaDepan} akan dihapus dari daftar"),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
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
                                                          controller
                                                              .deleteContact(
                                                                  contacts.id!);
                                                          Navigator.pop(
                                                              context);
                                                          showDialog(
                                                            barrierDismissible:
                                                                true,
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                backgroundColor:
                                                                    Colors.blue,
                                                                title: const Text(
                                                                    "Kontak berhasil dihapus"),
                                                                content: Lottie
                                                                    .asset(
                                                                        "assets/checklist.json",
                                                                        width:
                                                                            200,
                                                                        height:
                                                                            200),
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
                                                borderRadius:
                                                    BorderRadius.circular(5),
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
                          },
                          itemCount: controller.contactsUpdate.length,
                          separatorBuilder: (context, index) => const Divider(),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () => Navigator.pushNamed(context, Routes.ADD),
            child: const Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
