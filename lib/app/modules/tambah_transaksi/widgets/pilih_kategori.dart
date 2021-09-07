import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';

class PilihKategori extends GetView<TambahTransaksiController> {
  const PilihKategori({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      label: "Pilih Kategori",
      hint: "Pilih Kategori",
      mode: Mode.MENU,
      dropdownSearchDecoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      showSelectedItem: true,
      items: ['Gojek', 'Makan'],
      onChanged: (value) {
        controller.kategori.value = value!;
      },
    );
  }
}
