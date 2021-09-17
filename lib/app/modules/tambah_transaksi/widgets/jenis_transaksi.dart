import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';

class JenisTransaksi extends GetView<TambahTransaksiController> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      label: "Jenis Transaksi",
      hint: "Pilih Jenis Transaksi",

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
      items: ['Pengeluaran', 'Pemasukan'],
      itemAsString: (item) {
        return item;
      },
      onChanged: (value) {
        // print(value);
        controller.jenisTransaksi.value = value!;

        print(controller.jenisTransaksi.value);
      },
      // selectedItem: 'Pengeluaran',
    );
  }
}
