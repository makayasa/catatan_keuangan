import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';

class NominalField extends GetView<TambahTransaksiController> {
  const NominalField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller.moneyMaskedTextController,
      maxLines: 1,
      validator: (value) {
        if (controller.moneyMaskedTextController.numberValue == 0) {
          return 'Masukan Nominal';
        }
        return null;
      },
      onChanged: (newVal) {
        if (newVal.length <= 25) {
          controller.digit.value = newVal;
        } else {
          controller.moneyMaskedTextController.value = new TextEditingValue(
            selection: new TextSelection(
                baseOffset: controller.maxLength.value,
                extentOffset: controller.maxLength.value,
                affinity: TextAffinity.downstream,
                isDirectional: false),
            composing: new TextRange(
              start: 0,
              end: controller.maxLength.value,
            ),
          );
        }
        // val.value = moneyMaskedTextController.numberValue.toInt();
        controller.jumlah.value = controller.moneyMaskedTextController.numberValue.toInt();
      },
      decoration: InputDecoration(
        fillColor: Color(0xffFEFEFF),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // border: InputBorder.none,
        hintText: 'Jumlah Transaksi',
      ),
    );
  }
}
