import 'package:catatan_keuangan/app/components/constants.dart';
import 'package:catatan_keuangan/app/components/default_text.dart';
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
            color: kSecondaryColor,
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
                DefText(
                  '${controller.tanggalSekarang}',
                  fontWeight: FontWeight.bold,
                ).semilarge,
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        DefText('Pemasukan').normal,
                        Container(
                          height: 25,
                          width: 100,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: DefText(
                              controller.totalPemasukan == null ? 'loading' : 'Rp.' + controller.money.format(controller.totalPemasukan),
                              color: kPrimaryColor,
                            ).normal,
                          ),
                        ),
                        // Text('${controller.tes.value}'),
                      ],
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        DefText('Pengeluaran').normal,
                        // Text(abc.jumlah == null ? 'loading' : '${abc.jumlah}'),
                        Container(
                          height: 25,
                          width: 100,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: DefText(
                              controller.totalPengeluaran == null ? 'loading' : 'Rp. ' + controller.money.format(controller.totalPengeluaran),
                              color: kRed,
                            ).normal,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        DefText('Saldo').normal,
                        Container(
                          height: 25,
                          width: 100,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: DefText(
                              controller.totalSaldo == null ? 'loading' : 'Rp. ' + controller.money.format(controller.totalSaldo),
                            ).normal,
                            // child: Text(
                            //   controller.totalSaldo == null ? 'loading' : 'Rp. ' + controller.money.format(controller.totalSaldo),
                            // ),
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
