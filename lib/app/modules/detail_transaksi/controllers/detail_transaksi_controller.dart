import 'package:catatan_keuangan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:catatan_keuangan/app/data/models/transaksi_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../../../data/database/database.dart';

class DetailTransaksiController extends GetxController {
  var welcome = 'ini dari id ke - ${Get.arguments}'.obs;

  TransactionModel detailData = TransactionModel();

  final money = NumberFormat("#,##0", "in_ID");

  //* variable untuk ditampilkan ke view
  var judul = 'Detail Catatan'.obs;

  var jenis = ''.obs;
  var jumlah = 0.obs;
  var kategori = ''.obs;
  var tgl = ''.obs;
  var catatan = ''.obs;
  var editMode = false.obs;

  var digit = ''.obs;
  var maxLength = 25.obs;

  Future getData(int id) async {
    detailData = await TransactionDatabase.instance.readTransaksi(id);

    jenis.value = detailData.jenis!;
    jumlah.value = detailData.jumlah!;
    kategori.value = detailData.kategori!;
    tgl.value = detailData.tgl!;
    catatan.value = detailData.catatan!;

    update();
  }

  late MoneyMaskedTextController moneyMaskedTextController = MoneyMaskedTextController(
    thousandSeparator: ',',
    leftSymbol: 'RP. ',
    precision: 0,
    decimalSeparator: "",
    initialValue: detailData.jumlah!.toDouble(),
  );

  List<String>? katPemasukan = ['Gaji', 'Bonus', 'Lembur', 'Penjualan', 'Dll'].obs;
  List<String>? katPengeluaran = ['Transportasi', 'Makan', 'Minum', 'Hiburan', 'Belanja', 'Top-up', 'Dll'].obs;
  var katKosong = [''].obs;

  kategoriController() {
    if (jenis.value == '') {
      update();
      return katKosong;
    } else if (jenis.value == 'Pemasukan') {
      update();
      return katPemasukan;
    } else if (jenis.value == 'Pengeluaran') {
      update();
      return katPengeluaran;
    }
  }

  hapusTransaksi(int id) async {
    // await TransactionDatabase.instance.deleteTransaksi(id);
    try {
      await TransactionDatabase.instance.deleteTransaksi(id);

      Get.defaultDialog(
          title: '',
          content: Text('Transaksi Berhasil di Hapus'),
          confirm: ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Get.offAllNamed(Routes.home);
            },
          ));
    } catch (err) {
      print(err);
    }
  }

  @override
  void onInit() {
    getData(Get.arguments);
    super.onInit();
  }

  @override
  void onReady() {
    // super.onReady();
  }

  @override
  void onClose() {}
}
