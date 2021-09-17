import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';

class DetailJenisTransaksi extends GetView<DetailTransaksiController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailTransaksiController>(
      init: Get.put(DetailTransaksiController()),
      builder: (ccc) {
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
          selectedItem: ccc.jenis.value,
          itemAsString: (item) {
            return item;
          },
          onChanged: (value) {
            ccc.jenis.value = value!;
          },
        );
      },
    );
  }
}
