import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class InfoBanner extends GetView<HomeController> {
  const InfoBanner({Key? key, required this.homeController}) : super(key: key);
  final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    // var tesSum = controller.dataSumPemasukan[0].jumlah;
    return GetBuilder<HomeController>(
      init: homeController,
      builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          decoration: BoxDecoration(
            color: Color(0XFF3B9FC4),
            // gradient: LinearGradient(
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            //   colors: [
            //     Color(0XFF3B9FC4),
            //     Color(0XFF2b738d),
            //   ],
            // ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${controller.tanggalSekarang}'),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Text('Pemasukan'),
                        Container(
                          height: 25,
                          width: 100,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              controller.totalPemasukan == null ? 'loading' : 'Rp. ' + controller.money.format(controller.totalPemasukan),
                              style: TextStyle(
                                color: Color(0XFF23dc65),
                              ),
                            ),
                          ),
                        ),
                        // Text('${controller.tes.value}'),
                      ],
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Text('Pengeluaran'),
                        // Text(abc.jumlah == null ? 'loading' : '${abc.jumlah}'),
                        Container(
                          height: 25,
                          width: 100,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              controller.totalPengeluaran == null ? 'loading' : 'Rp. ' + controller.money.format(controller.totalPengeluaran),
                              style: TextStyle(
                                color: Color(0XFFC93661),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Text('Saldo'),
                        Container(
                          height: 25,
                          width: 100,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              controller.totalSaldo == null ? 'loading' : 'Rp. ' + controller.money.format(controller.totalSaldo),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
