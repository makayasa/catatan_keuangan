import 'package:catatan_keuangan/app/data/models/transaksi_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class TransactionDatabase {
  static final TransactionDatabase instance = TransactionDatabase._init();

  static Database? _database;

  TransactionDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('transaksi.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textNotNull = 'TEXT NOT NULL';
    final intNotNull = 'INTEGER NOT NULL';

    await db.execute(''' 
      CREATE TABLE $tableTransaksi (
        ${TransaksiFields.id} $idType,
        ${TransaksiFields.jenis} $textNotNull,
        ${TransaksiFields.jumlah} $intNotNull,
        ${TransaksiFields.kategori} $textNotNull,
        ${TransaksiFields.tgl} $textNotNull,
        ${TransaksiFields.catatan} $textNotNull
      )
    ''');
  }

  Future<TransactionModel> createTransaksi(TransactionModel transaksi) async {
    final db = await instance.database;

    final id = await db.insert(tableTransaksi, transaksi.toJson());
    return transaksi.copy(id: id);
  }

  Future<TransactionModel> readTransaksi(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableTransaksi,
      columns: TransaksiFields.values,
      where: '${TransaksiFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return TransactionModel.fromJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<TransactionModel>> readAllTransaksi() async {
    final db = await instance.database;

    final orderBy = "${TransaksiFields.id} ASC";
    final result = await db.query(tableTransaksi, orderBy: orderBy);

    return result.map((e) => TransactionModel.fromJson(e)).toList();
  }

  Future<int> updateTransaksi(TransactionModel transaksi) async {
    final db = await instance.database;

    return db.update(
      tableTransaksi,
      transaksi.toJson(),
      where: '${TransaksiFields.id} = ?',
      whereArgs: [transaksi.id],
    );
  }

  Future<int> deleteTransaksi(int id) async {
    final db = await instance.database;

    return db.delete(
      tableTransaksi,
      where: '${TransaksiFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
