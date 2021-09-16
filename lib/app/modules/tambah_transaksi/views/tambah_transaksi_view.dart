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
        title: Text('Tambah Transaksi'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0XFF3BC460),
                Color(0XFF3BC4A4),
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 75),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF8F5F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: JenisTransaksi(),
              ),
              SizedBox(
                height: 16.5,
              ),
              NominalField(),
              SizedBox(
                height: 16.5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF8F5F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PilihKategori(),
              ),
              SizedBox(
                height: 16.5,
              ),
              PilihTanggal(),
              SizedBox(
                height: 16.5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF8F5F1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Catatan(),
              ),
              SizedBox(
                height: 35,
              ),
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
