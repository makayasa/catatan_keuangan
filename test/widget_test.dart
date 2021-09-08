import 'package:catatan_keuangan/app/data/database/database.dart';

void main() async {
  var data = await TransactionDatabase.instance.readTransaksi(1);
  print(data);
}
