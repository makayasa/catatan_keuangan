import 'package:catatan_keuangan/app/data/models/transaksi_model.dart';
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
    var saldo;
    var dataPemasukan = (await TransactionDatabase.instance.sumJumlah('Pemasukan'))[0]['jumlah'];
    var dataPengeluaran = (await TransactionDatabase.instance.sumJumlah('Pengeluaran'))[0]['jumlah'];
    saldo = (dataPemasukan != null ? dataPemasukan : 0) - (dataPengeluaran != null ? dataPengeluaran : 0);
    update();
    return totalSaldo = saldo;
  }

  tanggalSekarangMethod() {
    _tanggal = DateTime.now();
    tanggalSekarang.value = DateFormat.yMMMMEEEEd('in').format(_tanggal!);
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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
