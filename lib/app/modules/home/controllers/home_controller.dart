import 'package:catatan_keuangan/app/data/models/transaksi_model.dart';
import 'package:catatan_keuangan/app/modules/detail_transaksi/controllers/detail_transaksi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../data/database/database.dart';

class HomeController extends GetxController {
  List<TransactionModel> data = [];

  int? totalPengeluaran;
  int? totalPemasukan;
  int? totalSaldo;

  DateTime? _tanggal;
  var tanggalSekarang = ''.obs;

  final money = NumberFormat("#,##0", "in_ID");

  Future refreshList() async {
    data = await TransactionDatabase.instance.readAllTransaksi();
    update();
  }

  Future sumPemasukan() async {
    var dataPemasukan = (await TransactionDatabase.instance.sumJumlah('Pemasukan'))[0]['jumlah'];
    if (dataPemasukan == null) {
      return totalPemasukan = 0;
    }
    update();
    return totalPemasukan = dataPemasukan;
  }

  Future sumPengeluaran() async {
    var dataPengeluaran = (await TransactionDatabase.instance.sumJumlah('Pengeluaran'))[0]['jumlah'];
    if (dataPengeluaran == null) {
      return totalPengeluaran = 0;
    }
    return totalPengeluaran = dataPengeluaran;
  }

  Future hitungSaldo() async {
    dynamic saldo = 0;
    var dataPemasukan = (await TransactionDatabase.instance.sumJumlah('Pemasukan'))[0]['jumlah'];
    var dataPengeluaran = (await TransactionDatabase.instance.sumJumlah('Pengeluaran'))[0]['jumlah'];
    // saldo = (dataPemasukan != null ? dataPemasukan : 0) - (dataPengeluaran != null ? dataPengeluaran : 0);
    // saldo = saldo ?? (dataPemasukan - dataPengeluaran);
    saldo = (dataPemasukan ?? 0) - (dataPengeluaran ?? 0);
    update();
    return totalSaldo = saldo;
  }

  tanggalSekarangMethod() {
    _tanggal = DateTime.now();
    tanggalSekarang.value = DateFormat.yMMMMEEEEd('in').format(_tanggal!);
  }

  late Offset offset;

  var isDragging = false.obs;

  var newOffsetX = 0.0.obs;
  var newOffsetY = 0.0.obs;

  void updatePosition(PointerMoveEvent pointerMoveEvent) {
    newOffsetX.value = offset.dx + pointerMoveEvent.delta.dx;
    newOffsetY.value = offset.dy + pointerMoveEvent.delta.dy;

    offset = Offset(newOffsetX.value, newOffsetY.value);
  }

  @override
  void onInit() {
    refreshList();
    sumPemasukan();
    sumPengeluaran();
    hitungSaldo();
    initializeDateFormatting();
    tanggalSekarangMethod();
    super.onInit();
    offset = Offset(200, 70);
  }

  @override
  void onReady() {
    // super.onReady();
  }

  @override
  void onClose() {}
}






// class DetailTransaksiController extends GetxController {
//   var welcome = 'ini dari id ke - ${Get.arguments}'.obs;

//   TransactionModel detailData = TransactionModel();

//   final money = NumberFormat("#,##0", "in_ID");

//   var jenis = ''.obs;
//   var jumlah = 0.obs;
//   var kategori = ''.obs;
//   var tgl = ''.obs;
//   var catatan = ''.obs;
//   var editMode = false.obs;

//   var digit = ''.obs;
//   var maxLength = 25.obs;

//   Future getData(int id) async {
//     detailData = await TransactionDatabase.instance.readTransaksi(id);

//     jenis.value = detailData.jenis!;
//     jumlah.value = detailData.jumlah!;
//     kategori.value = detailData.kategori!;
//     tgl.value = detailData.tgl!;
//     catatan.value = detailData.catatan!;

//     update();
//   }

//   late MoneyMaskedTextController moneyMaskedTextController = MoneyMaskedTextController(
//     thousandSeparator: ',',
//     leftSymbol: 'RP. ',
//     precision: 0,
//     decimalSeparator: "",
//     initialValue: detailData.jumlah!.toDouble(),
//   );

//   List<String>? katPemasukan = ['Gaji', 'Bonus', 'Lembur', 'Penjualan', 'Dll'].obs;
//   List<String>? katPengeluaran = ['Transportasi', 'Makan', 'Minum', 'Hiburan', 'Belanja', 'Top-up', 'Dll'].obs;
//   var katKosong = [''].obs;

//   kategoriController() {
//     if (jenis.value == '') {
//       update();
//       return katKosong;
//     } else if (jenis.value == 'Pemasukan') {
//       update();
//       return katPemasukan;
//     } else if (jenis.value == 'Pengeluaran') {
//       update();
//       return katPengeluaran;
//     }
//   }

  // hapusTransaksi(int id) async {
  //   // await TransactionDatabase.instance.deleteTransaksi(id);
  //   try {
  //     await TransactionDatabase.instance.deleteTransaksi(id);

  //     Get.defaultDialog(
  //         title: '',
  //         content: Text('Transaksi Berhasil di Hapus'),
  //         confirm: ElevatedButton(
  //           child: Text('OK'),
  //           onPressed: () {
  //             Get.offAllNamed(Routes.home);
  //           },
  //         ));
  //   } catch (err) {
  //     print(err);
  //   }
  // }

//   @override
//   void onInit() {
//     getData(Get.arguments);
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     // super.onReady();
//   }

//   @override
//   void onClose() {}
// }
