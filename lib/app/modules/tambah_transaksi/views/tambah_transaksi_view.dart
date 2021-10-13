import 'package:catatan_keuangan/app/components/constants.dart';
import 'package:catatan_keuangan/app/components/default_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';
import '../widgets/jenis_transaksi.dart';
import '../widgets/nominal_field.dart';
import '../widgets/pilih_kategori.dart';
import '../widgets/tanggal.dart';
import '../widgets/catatan.dart';

class TambahTransaksiView extends GetView<TambahTransaksiController> {
  const TambahTransaksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBgBlack,
          ),
        ),
        title: DefText(
          'Tambah Transaksi',
          color: kBgBlack,
          fontWeight: FontWeight.bold,
        ).large,
        elevation: 0,
      ),
      backgroundColor: kBgWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 15,
            right: 15,
            bottom: 20,
          ),
          child: Column(
            children: [
              JenisTransaksi(),
              SizedBox(
                height: 16.5,
              ),
              NominalField(),
              SizedBox(
                height: 16.5,
              ),
              PilihKategori(),
              SizedBox(
                height: 16.5,
              ),
              PilihTanggal(),
              SizedBox(
                height: 16.5,
              ),
              Catatan(),
              SizedBox(
                height: 35,
              ),
              Spacer(),
              ElevatedButton(
                child: Text('Simpan Transaksi'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFF3B9FC4),
                ),
                onPressed: () {
                  controller.tambahTransaksi();
                  //*Route ke menu ada di Controller
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
