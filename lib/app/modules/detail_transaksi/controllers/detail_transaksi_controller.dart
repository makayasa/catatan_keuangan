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

  // var jenis = ''.obs;
  // int? jumlah;
  // String? kategori;
  // String? tgl;
  // String? catatan;

  var jenis = ''.obs;
  var jumlah = 0.obs;
  var kategori = ''.obs;
  var tgl = ''.obs;
  var catatan = ''.obs;
  // var editMode = false.obs;

  var digit = ''.obs;
  var maxLength = 25.obs;

  Future getData(int id) async {
    detailData = await TransactionDatabase.instance.readTransaksi(id);

    jenis.value = detailData.jenis!;
    jumlah.value = detailData.jumlah!;
    kategori.value = detailData.kategori!;
    tgl.value = detailData.tgl!;
    catatan.value = detailData.catatan!;

    _selectedDate = DateTime.parse(detailData.tgl!);

    MoneyMaskedTextController _moneyMaskedTextController = MoneyMaskedTextController(
      thousandSeparator: ',',
      leftSymbol: 'RP. ',
      precision: 0,
      decimalSeparator: "",
      // initialValue: detailData.jumlah!.toDouble(),
      initialValue: (detailData.jumlah ?? 0).toDouble(),
    );

    TextEditingController _tanggalFormatted = TextEditingController(
      text: DateFormat.yMMMMEEEEd('in').format(DateTime.parse(detailData.tgl!)),
    );

    TextEditingController _catatanController = TextEditingController(
      text: detailData.catatan,
    );

    moneyMaskedTextController = _moneyMaskedTextController;
    tanggalFormatted = _tanggalFormatted;
    catatanController = _catatanController;
    update();
  }

  MoneyMaskedTextController moneyMaskedTextController = MoneyMaskedTextController();
  TextEditingController tanggalFormatted = TextEditingController();
  TextEditingController catatanController = TextEditingController();

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

  List<String>? katPemasukan = ['Gaji', 'Bonus', 'Lembur', 'Penjualan', 'Dll'].obs;
  List<String>? katPengeluaran = ['Transportasi', 'Makan', 'Minum', 'Hiburan', 'Belanja', 'Top-up', 'Dll'].obs;
  var katKosong = [''].obs;

  kategoriController() {
    if (jenis.value == '') {
      return katKosong;
    } else if (jenis.value == 'Pemasukan') {
      return katPemasukan;
    } else if (jenis.value == 'Pengeluaran') {
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
        barrierDismissible: false,
        confirm: ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            Get.offAllNamed(Routes.home);
          },
        ),
      );
    } catch (err) {
      print(err);
    }
  }

  ubahTransaksi() async {
    try {
      await TransactionDatabase.instance.updateTransaksi(
        TransactionModel(
          id: Get.arguments,
          jenis: jenis.value,
          jumlah: jumlah.value,
          kategori: kategori.value,
          tgl: tgl.value,
          catatan: catatan.value,
        ),
      );
      Get.defaultDialog(
        title: '',
        content: Text('Transaksi Berhasil di Ubah'),
        barrierDismissible: false,
        confirm: ElevatedButton(
          child: Text('OK'),
          onPressed: () {
            Get.offAllNamed(Routes.home);
          },
        ),
      );
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
