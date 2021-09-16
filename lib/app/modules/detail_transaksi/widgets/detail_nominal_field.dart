import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_transaksi_controller.dart';

class DetailNominal extends GetView<DetailTransaksiController> {
  const DetailNominal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          keyboardType: TextInputType.number,
          controller: controller.moneyMaskedTextController,
          maxLines: 1,
          // initialValue: '${controller.jumlah.value}',
          onChanged: (newVal) {
            if (newVal.length <= 25) {
              controller.digit.value = newVal;
            } else {
              controller.moneyMaskedTextController.value = TextEditingValue(
                selection: TextSelection(
                    baseOffset: controller.maxLength.value,
                    extentOffset: controller.maxLength.value,
                    affinity: TextAffinity.downstream,
                    isDirectional: false),
                composing: TextRange(
                  start: 0,
                  end: controller.maxLength.value,
                ),
              );
            }
            controller.jumlah.value = controller.moneyMaskedTextController.numberValue.toInt();
            print(controller.jumlah.value);
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
        ));
  }
}
