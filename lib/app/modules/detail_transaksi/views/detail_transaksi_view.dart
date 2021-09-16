import 'package:catatan_keuangan/app/modules/detail_transaksi/widgets/detail_nominal_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';
import '../widgets/detail_jenis_transaksi.dart';
import '../widgets/detail_pilih_kategori.dart';

class DetailTransaksiView extends GetView<DetailTransaksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailTransaksiView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          DetailJenisTransaksi(),
          SizedBox(
            height: 10,
          ),
          DetailNominal(),
          SizedBox(
            height: 35,
          ),
          DetailPilihKategori(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(controller.catatan.value),
              ),
              Obx(() => ElevatedButton(
                    child: Text('Edit'),
                    onPressed: () {
                      controller.editMode.value = true;
                    },
                  )),
              SizedBox(
                width: 15,
              ),
              Obx(() => ElevatedButton(
                    child: Text('Delete'),
                    onPressed: () {
                      controller.hapusTransaksi(Get.arguments);
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
