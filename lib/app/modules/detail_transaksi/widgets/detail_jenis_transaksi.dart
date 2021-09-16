import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';

class DetailJenisTransaksi extends GetView<DetailTransaksiController> {
  const DetailJenisTransaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownSearch<String>(
          label: "Jenis Transaksi",
          hint: "Pilih Jenis Transaksi",
          mode: Mode.MENU,
          showSelectedItem: true,
          items: ['Pengeluaran', 'Pemasukan'],
          selectedItem: '${controller.detailData.jenis}',
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          itemAsString: (item) {
            return item;
          },
          onChanged: (value) {
            controller.detailData.jenis = value!;
          },
        ));
  }
}
