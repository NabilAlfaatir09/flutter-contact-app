import 'package:flutter/material.dart';
import 'package:flutter_contact_app/app/modules/home/widgets/button_widget.dart';
import 'package:flutter_contact_app/app/modules/home/widgets/card_widget.dart';
import 'package:flutter_contact_app/app/modules/home/widgets/search_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
                        const SizedBox(
                          height: 40,
                        ),
                        SearchWidget(controller: controller),
                        const SizedBox(
                          height: 50,
                        ),
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
                          height: 40,
                        ),
                        SearchWidget(controller: controller),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () => controller.sortNama(),
                              child: const Icon(
                                Icons.sort,
                                size: 35,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Sort",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var contacts = controller.contactsUpdate[index];
                            return cardWidget(context, contacts);
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
      floatingActionButton: const ButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
