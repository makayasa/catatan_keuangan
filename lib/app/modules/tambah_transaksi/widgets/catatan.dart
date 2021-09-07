import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';

class Catatan extends GetView<TambahTransaksiController> {
  const Catatan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Catatan / Keterangan (optional)',
        // hintText: 'Berat Barang',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        controller.catatan.value = value;
      },
    );
  }
}
