import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

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

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
