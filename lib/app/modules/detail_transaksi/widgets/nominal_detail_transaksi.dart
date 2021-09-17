import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';

class NominalFieldDetailTransaksi extends GetView<DetailTransaksiController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailTransaksiController>(
      init: Get.put(DetailTransaksiController()),
      builder: (ccc) {
        return TextFormField(
          keyboardType: TextInputType.number,
          controller: ccc.moneyMaskedTextController,
          maxLines: 1,

          // validator: (value) {
          //   if(controller.moneyMaskedTextController.numberValue == 0) {
          //     return 'Masu'
          //   }
          // },
          onChanged: (newVal) {
            if (newVal.length <= 25) {
              ccc.digit.value = newVal;
            } else {
              ccc.moneyMaskedTextController.value = TextEditingValue(
                selection: TextSelection(
                  baseOffset: ccc.maxLength.value,
                  extentOffset: ccc.maxLength.value,
                  affinity: TextAffinity.downstream,
                  isDirectional: false,
                ),
                composing: TextRange(
                  start: 0,
                  end: ccc.maxLength.value,
                ),
              );
            }

            ccc.jumlah = ccc.moneyMaskedTextController.numberValue.toInt();
            print(ccc.welcome.value);
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
      },
    );
  }
}
