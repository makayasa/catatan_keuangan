import 'package:catatan_keuangan/app/modules/tambah_transaksi/bindings/tambah_transaksi_binding.dart';
import 'package:catatan_keuangan/app/modules/tambah_transaksi/views/tambah_transaksi_view.dart';
import 'package:get/get.dart';

import 'package:catatan_keuangan/app/modules/home/bindings/home_binding.dart';
import 'package:catatan_keuangan/app/modules/home/views/home_view.dart';

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
      page: () => TambahTransaksi(),
      binding: TambahTransaksiBinding(),
    ),
  ];
}
