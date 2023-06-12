import 'dart:convert';

LaporanDataModel dataModelFromJson(String str) => LaporanDataModel.fromJson(json.decode(str));

String dataModelToJson(LaporanDataModel data) => json.encode(data.toJson());

class LaporanDataModel {
  LaporanDataModel({
    required this.code,
    required this.laporan,
    required this.total,
  });

  int code;
  List<Laporan> laporan;
  int total;


  factory LaporanDataModel.fromJson(Map<String, dynamic> json) => LaporanDataModel(
    code: json["code"],
    laporan: List<Laporan>.from(json["data"].map((x) => Laporan.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "laporan": List<dynamic>.from(laporan.map((x) => x.toJson())),
    "total": total
  };
}

class Laporan {
  Laporan({
    required this.id,
    required this.userId,
    required this.judul,
    required this.alamat,
    required this.provinsi,
    required this.kabkota,
    required this.kecamatan,
    required this.deskripsi,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  String judul;
  String alamat;
  String provinsi;
  String kabkota;
  String kecamatan;
  String deskripsi;
  String status;
  String createdAt;
  String updatedAt;

  factory Laporan.fromJson(Map<String, dynamic> json) => Laporan(
    id: json["id"],
    userId: json["user_id"],
    judul: json["judul"],
    alamat: json["alamat"],
    provinsi: json["provinsi"],
    kabkota: json["kabkota"],
    kecamatan: json["kecamatan"],
    deskripsi: json["deskripsi"],
    status: json["status"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "judul": judul,
    "alamat": alamat,
    "provinsi": provinsi,
    "kabkota": kabkota,
    "kecamatan": kecamatan,
    "deskripsi": deskripsi,
    "status": status,
    "createdAt": createdAt,
    "updatedAt": updatedAt
  };
}