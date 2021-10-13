import 'package:catatan_keuangan/app/components/constants.dart';
import 'package:catatan_keuangan/app/components/default_text.dart';
import 'package:catatan_keuangan/app/modules/detail_transaksi/widgets/catatan_detail_transaksi.dart';
import 'package:catatan_keuangan/app/modules/detail_transaksi/widgets/jenis_detail_transaksi.dart';
import 'package:catatan_keuangan/app/modules/detail_transaksi/widgets/kategori_detail_transaksi.dart';
import 'package:catatan_keuangan/app/modules/detail_transaksi/widgets/nominal_detail_transaksi.dart';
import 'package:catatan_keuangan/app/modules/detail_transaksi/widgets/tanggal_detail_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';

class DetailTransaksiView extends GetView<DetailTransaksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBgBlack,
          ),
        ),
        title: DefText(
          'Detail Transaksi',
          color: kBgBlack,
          fontWeight: FontWeight.bold,
        ).large,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
            left: 15,
            right: 15,
            bottom: 20,
          ),
          child: Column(
            children: [
              DetailJenisTransaksi(),
              SizedBox(
                height: 16.5,
              ),
              NominalFieldDetailTransaksi(),
              SizedBox(
                height: 16.5,
              ),
              KategoriDetailTransaksi(),
              SizedBox(
                height: 15,
              ),
              PilihTangalDetailTransaksi(),
              SizedBox(
                height: 16.5,
              ),
              CatatanDetailTransaksi(),
              SizedBox(
                height: 35,
              ),
              SizedBox(height: 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('Ubah Transaksi'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0XFF3B9FC4),
                    ),
                    onPressed: () {
                      controller.ubahTransaksi();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Hapus Transaksi'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0XFF3B9FC4),
                    ),
                    onPressed: () {
                      controller.hapusTransaksi(Get.arguments);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
