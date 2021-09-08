import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';

import 'package:catatan_keuangan/app/data/database/database.dart';
import 'package:catatan_keuangan/app/data/models/transaksi_model.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class TambahTransaksiController extends GetxController {
  var jenisTransaksi = ''.obs;
  var val = 0.obs;
  var kategori = ''.obs;
  var tgl = ''.obs;
  var catatan = ''.obs;

  late MoneyMaskedTextController moneyMaskedTextController = MoneyMaskedTextController(
    thousandSeparator: ',',
    leftSymbol: 'RP. ',
    precision: 0,
    decimalSeparator: "",
    initialValue: 0,
  );
  var nominal = "".obs;
  var maxLength = 25.obs;

  void tambahTransaksi() async {
    try {
      await TransactionDatabase.instance.createTransaksi(
        TransactionModel(
          jenis: jenisTransaksi.value,
          jumlah: val.value,
          kategori: kategori.value,
          tgl: tgl.value,
          catatan: catatan.value,
        ),
      );

      Get.defaultDialog(title: '', content: Text('Transaksi Berhasil di simpan'));
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

  // void onChangedNominal(String newVal) {
  //   if (newVal.length <= 25) {
  //     nominal.value = newVal;
  //   } else {
  //     moneyMaskedTextController.value = new TextEditingValue(
  //       text: nominal.value,
  //       selection:
  //           new TextSelection(baseOffset: maxLength.value, extentOffset: maxLength.value, affinity: TextAffinity.downstream, isDirectional: false),
  //       composing: new TextRange(
  //         start: 0,
  //         end: maxLength.value,
  //       ),
  //     );
  //   }
  //   // val.value = moneyMaskedTextController.numberValue.toInt();
  //   val.value = moneyMaskedTextController.numberValue.toInt();
  // }

  @override
  void onInit() {
    initializeDateFormatting();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
