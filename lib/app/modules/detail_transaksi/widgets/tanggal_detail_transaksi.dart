import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';

class PilihTangalDetailTransaksi extends GetView<DetailTransaksiController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailTransaksiController>(
      init: Get.put(DetailTransaksiController()),
      builder: (ccc) {
        return TextField(
          controller: ccc.tanggalFormatted,
          readOnly: true,
          onTap: () {
            ccc.selecDate(context);
          },
          decoration: InputDecoration(
            fillColor: Color(0xffFEFEFF),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            hintText: 'Pilih Tanggal',
          ),
        );
      },
    );
  }
}
