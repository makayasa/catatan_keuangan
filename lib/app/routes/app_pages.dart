import 'package:catatan_keuangan/app/modules/detail_transaksi/bindings/detail_transaksi_binding.dart';
import 'package:catatan_keuangan/app/modules/detail_transaksi/views/detail_transaksi_view.dart';
import 'package:get/get.dart';

import 'package:catatan_keuangan/app/modules/home/bindings/home_binding.dart';
import 'package:catatan_keuangan/app/modules/home/views/home_view.dart';
import 'package:catatan_keuangan/app/modules/tambah_transaksi/bindings/tambah_transaksi_binding.dart';
import 'package:catatan_keuangan/app/modules/tambah_transaksi/views/tambah_transaksi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TT,
      page: () => TambahTransaksiView(),
      binding: TambahTransaksiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRANSAKSI,
      page: () => DetailTransaksiView(),
      binding: DetailTransaksiBinding(),
    ),
  ];
}
