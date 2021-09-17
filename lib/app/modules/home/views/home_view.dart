import 'package:catatan_keuangan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import './../widgets/info_banner.dart';
import './../widgets/divider.dart';
import './../widgets/listview_transaksi.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Keuangan'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: Color(0XFF3B9FC4),
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.tambahTransaksi);
        },
      ),
      backgroundColor: Color(0XFFf8f5f1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: size.height * 0.15,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.15 - 27,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0XFF3BC460),
                          Color(0XFF3BC4A4),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: InfoBanner(
                      homeController: homeController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Pemisah(),
            ListViewTransaksi(homeController: homeController),
          ],
        ),
      ),
    );
  }
}
