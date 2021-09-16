import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';

class DetailPilihKategori extends GetView<DetailTransaksiController> {
  const DetailPilihKategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownSearch<String>(
          label: "Pilih Kategori",
          hint: "Pilih Kategori",
          mode: Mode.MENU,
          showSelectedItem: true,
          items: controller.kategoriController(),
          selectedItem: '${controller.detailData.kategori}',
          // itemAsString: (item) {
          //   return item;
          // },
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) {
            controller.kategori.value = value!;
          },
        ));
  }
}
