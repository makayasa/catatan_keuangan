import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class InfoBanner extends GetView<HomeController> {
  const InfoBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        color: Colors.amber,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selasa, 7 September 2020'),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Text('Pengeluaran'),
                    Text('${controller.tes.value}'),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Text('Pemasukkan'),
                    Text('Rp.2,500,000'),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Text('Saldo'),
                    Text('Rp.2,000,000'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
