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
        title: Text('DetailTransaksiView'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0XFF3BC460),
                Color(0XFF3BC4A4),
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 75),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF8F5F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DetailJenisTransaksi(),
              ),
              SizedBox(
                height: 16.5,
              ),
              NominalFieldDetailTransaksi(),
              SizedBox(
                height: 16.5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF8F5F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: KategoriDetailTransaksi(),
              ),
              SizedBox(
                height: 15,
              ),
              PilihTangalDetailTransaksi(),
              SizedBox(
                height: 16.5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF8F5F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CatatanDetailTransaksi(),
              ),
              SizedBox(
                height: 35,
              ),
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
