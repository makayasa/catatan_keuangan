import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';

class CatatanDetailTransaksi extends GetView<DetailTransaksiController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailTransaksiController>(
      init: Get.put(DetailTransaksiController()),
      builder: (ccc) {
        return TextField(
          controller: ccc.catatanController,
          decoration: InputDecoration(
            labelText: 'Catatan / Keterangan (optional)',
            // hintText: 'Berat Barang',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onChanged: (value) {
            ccc.catatan = value;
          },
        );
      },
    );
  }
}
