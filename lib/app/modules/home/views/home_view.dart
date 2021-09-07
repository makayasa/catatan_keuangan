import 'package:catatan_keuangan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import './../widgets/info_banner.dart';
import './../widgets/divider.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Keuangan'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.TT);
        },
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.15,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.15 - 27,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
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
                  child: InfoBanner(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Pemisah(),
        ],
      ),
    );
  }
}
