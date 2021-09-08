import 'package:catatan_keuangan/app/data/database/database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var tes = 'tes'.obs;
  List data = [].obs;

  onDatabase() async {
    data = await TransactionDatabase.instance.readAllTransaksi();
    print(data);
  }

  final count = 0.obs;
  @override
  void onInit() async {
    onDatabase();
    // await TransactionDatabase.instance.readAllTransaksi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
