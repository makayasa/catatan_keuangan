import 'package:catatan_keuangan/app/data/database/database.dart';
import 'package:catatan_keuangan/app/data/models/transaksi_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';
import '../widgets/jenis_transaksi.dart';
import '../widgets/nominal_field.dart';
import '../widgets/pilih_kategori.dart';
import '../widgets/tanggal.dart';
import '../widgets/catatan.dart';

class TambahTransaksi extends GetView<TambahTransaksiController> {
  const TambahTransaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Transaksi'),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          JenisTransaksi(),
          SizedBox(
            height: 10,
          ),
          NominalField(),
          SizedBox(
            height: 10,
          ),
          PilihKategori(),
          SizedBox(
            height: 10,
          ),
          Tanggal(),
          SizedBox(
            height: 10,
          ),
          Catatan(),
          SizedBox(
            height: 35,
          ),
          ElevatedButton(
            child: Text('Simpan Transaksi'),
            onPressed: () async {
              print('${controller.tgl.value}');
              await TransactionDatabase.instance.createTransaksi(
                TransactionModel(
                  jenis: controller.jenisTransaksi.value,
                  jumlah: controller.val.value,
                  kategori: controller.kategori.value,
                  tgl: controller.tgl.value,
                  catatan: controller.catatan.value,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
