import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class ListViewTransaksi extends GetView<HomeController> {
  const ListViewTransaksi({
    Key? key,
    required this.homeController,
    // required this.controller,
  }) : super(key: key);

  final HomeController homeController;
  // final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0XFF3BC460),
              Color(0XFF3BC4A4),
            ],
          ),
        ),
        child: GetBuilder<HomeController>(
          init: homeController,
          builder: (value) {
            return ListView.separated(
              itemCount: value.data.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                final dataTransaksi = value.data[index];

                return Container(
                  margin: EdgeInsets.only(left: 13.5, right: 13.5, top: 8.5, bottom: 8.5),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0XFF4999b6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 12,
                        child: Text(
                          DateFormat.yMMMMd('in').format(DateTime.parse(dataTransaksi.tgl!)),
                          style: TextStyle(fontSize: 14, color: Color(0XFFf8f5f1)),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 12,
                        child: Text(
                          '${dataTransaksi.kategori}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 75,
                        left: 12,
                        child: Text(
                          '${dataTransaksi.catatan}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        // right: dataTransaksi.jenis == 'Pemasukan' ? 80 : 12,
                        right: 12,
                        child: Container(
                          // color: Colors.amber,
                          height: 25,
                          width: 100,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Rp. ' + controller.money.format(dataTransaksi.jumlah),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: dataTransaksi.jenis == 'Pemasukan' ? Color(0XFF23dc65) : Color(0XFFC93661),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -8.5,
                        right: -5,
                        child: Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
