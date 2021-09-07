import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';

class Tanggal extends GetView<TambahTransaksiController> {
  const Tanggal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Tanggal',
        // hintText: 'Berat Barang',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        controller.tgl.value = value;
        print(controller.tgl.value);
      },
    );
  }
}
