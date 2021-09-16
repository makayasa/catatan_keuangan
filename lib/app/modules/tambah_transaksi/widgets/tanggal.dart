import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';

class PilihTanggal extends GetView<TambahTransaksiController> {
  const PilihTanggal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.tanggalFormatted,
      readOnly: true,
      onTap: () {
        controller.selecDate(context);
      },
      decoration: InputDecoration(
        fillColor: Color(0xffFEFEFF),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        hintText: 'Pilih Tanggal',
      ),
      // onChanged: (value) {
      //   controller.tgl.value = value;
      //   print(controller.tgl.value);
      // },
    );
  }
}
