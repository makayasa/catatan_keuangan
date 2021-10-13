import 'package:catatan_keuangan/app/components/constants.dart';
import 'package:catatan_keuangan/app/components/default_text.dart';
import 'package:catatan_keuangan/app/components/primary_button.dart';
import 'package:catatan_keuangan/app/modules/home/widgets/dragable_floating_action_button.dart';
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
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            // title: Text('Catatan Keuangan'),
            title: DefText(
              'Catatan Keuangan',
              color: kBgBlack,
              fontWeight: FontWeight.bold,
            ).large,
            centerTitle: true,
            elevation: 0,
          ),
          // floatingActionButton: FloatingActionButton(
          //   elevation: 1,
          //   backgroundColor: Color(0XFF3B9FC4),
          //   child: Icon(Icons.add),
          //   onPressed: () {
          //     Get.toNamed(Routes.tambahTransaksi);
          //   },
          // ),
          backgroundColor: kBgWhite,
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
                          color: kPrimaryColor,
                          // gradient: LinearGradient(
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter,
                          //   colors: [
                          //     Color(0XFF3BC460),
                          //     Color(0XFF3BC4A4),
                          //   ],
                          // ),
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
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.5),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: DefText('Tambah Transaksi').normal,
                          style: ElevatedButton.styleFrom(
                            primary: kBlue,
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.tambahTransaksi);
                          },
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          child: DefText('Grafik').normal,
                          style: ElevatedButton.styleFrom(
                            primary: kBlue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                // Divider(
                //   indent: 13.5,
                //   endIndent: 13.5,
                //   color: kBgBlack,
                // ),
                SizedBox(height: 10),
                ListViewTransaksi(homeController: homeController),
              ],
            ),
          ),
        );
      },
    );
  }
}
