import 'package:catatan_keuangan/app/components/constants.dart';
import 'package:catatan_keuangan/app/components/default_text.dart';
import 'package:catatan_keuangan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';

import 'package:catatan_keuangan/app/data/database/database.dart';
import 'package:catatan_keuangan/app/data/models/transaksi_model.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class TambahTransaksiController extends GetxController {
  var jenisTransaksi = ''.obs;
  var jumlah = 0.obs;
  var kategori = ''.obs;
  var tgl = ''.obs;
  var catatan = ''.obs;

  List<String>? katPemasukan = ['Gaji', 'Bonus', 'Lembur', 'Penjualan', 'Dll'].obs;
  List<String>? katPengeluaran = ['Transportasi', 'Makan', 'Minum', 'Hiburan', 'Belanja', 'Top-up', 'Dll'].obs;
  var katKosong = [''].obs;

  kategoriController() {
    if (jenisTransaksi.value == '') {
      update();
      return katKosong;
    } else if (jenisTransaksi.value == 'Pemasukan') {
      update();
      return katPemasukan;
    } else if (jenisTransaksi.value == 'Pengeluaran') {
      update();
      return katPengeluaran;
    }
  }

  late MoneyMaskedTextController moneyMaskedTextController = MoneyMaskedTextController(
    thousandSeparator: ',',
    leftSymbol: 'RP. ',
    precision: 0,
    decimalSeparator: "",
    initialValue: 0,
  );
  var digit = "".obs;
  var maxLength = 25.obs;

  void tambahTransaksi() async {
    if (jenisTransaksi.value == '' || jumlah.value == 0 || kategori.value == '' || tgl.value == '') {
      return Get.defaultDialog(
        title: 'Error',
        content: DefText('Form Belum Lengkap', color: kErrorColor).large,
        // content: Text('Form Belum Lengkap'),
        backgroundColor: kBgWhite,
        barrierDismissible: false,
        confirm: ElevatedButton(
          child: Text('OK'),
          style: ElevatedButton.styleFrom(
            primary: Color(0XFF3B9FC4),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      );
    }
    try {
      await TransactionDatabase.instance.createTransaksi(
        TransactionModel(
          jenis: jenisTransaksi.value,
          jumlah: jumlah.value,
          kategori: kategori.value,
          tgl: tgl.value,
          catatan: catatan.value,
        ),
      );

      Get.defaultDialog(
        title: '',
        content: Text('Transaksi Berhasil di simpan'),
        barrierDismissible: false,
        confirm: ElevatedButton(
          child: Text('tes'),
          style: ElevatedButton.styleFrom(
            primary: Color(0XFF3B9FC4),
          ),
          onPressed: () {
            Get.offAllNamed(Routes.home);
          },
        ),
      );
    } catch (err) {
      print(err);
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: err.toString(),
      );
    }
  }

  late TextEditingController tanggalFormatted = TextEditingController();
  // String? tanggal;
  DateTime? _selectedDate;

  selecDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      // locale: Locale('id' 'ID'),
      initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      tanggalFormatted
        ..text = DateFormat.yMMMMEEEEd('in').format(_selectedDate!)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: tanggalFormatted.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
      tgl.value = _selectedDate.toString();
    }
  }

  @override
  void onInit() {
    initializeDateFormatting();
    kategoriController();

    super.onInit();
  }

  @override
  void onReady() {
    kategoriController();

    super.onReady();
  }

  @override
  void onClose() {}
}
