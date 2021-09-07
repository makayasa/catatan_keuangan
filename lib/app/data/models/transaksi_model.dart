// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_connect/http/src/utils/utils.dart';

final String tableTransaksi = 'transaksi';

class TransaksiFields {
  static final List<String> values = [
    //add all fields
    id, jenis, jumlah, kategori, tgl, catatan
  ];

  static final String id = 'id';
  static final String jenis = 'jenis';
  static final String jumlah = 'jumlah';
  static final String kategori = 'kategori';
  static final String tgl = 'tgl';
  static final String catatan = 'catatan';
}

List<TransactionModel> transactionModelFromJson(String str) => List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
  TransactionModel({
    this.id,
    this.jenis,
    this.jumlah,
    this.kategori,
    this.tgl,
    this.catatan,
  });

  int? id;
  String? jenis;
  int? jumlah;
  String? kategori;
  String? tgl;
  String? catatan;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        id: json["id"],
        jenis: json["jenis"],
        jumlah: json["jumlah"],
        kategori: json["kategori"],
        tgl: json["tgl"],
        catatan: json["catatan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis": jenis,
        "jumlah": jumlah,
        "kategori": kategori,
        "tgl": tgl,
        "catatan": catatan,
      };

  static List<TransactionModel> fromJsonList(List list) {
    if (list.length == 0) return List<TransactionModel>.empty();
    return list.map((item) => TransactionModel.fromJson(item)).toList();
  }

  TransactionModel copy({
    int? id,
    String? jenis,
    int? jumlah,
    String? kategori,
    String? tgl,
    String? catatan,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        jenis: jenis ?? this.jenis,
        jumlah: jumlah ?? this.jumlah,
        kategori: kategori ?? this.kategori,
        tgl: tgl ?? this.tgl,
        catatan: catatan ?? this.catatan,
      );
}
