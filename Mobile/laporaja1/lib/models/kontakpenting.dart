import 'dart:convert';

KontakDataModel dataModelFromJson(String str) => KontakDataModel.fromJson(json.decode(str));

String dataModelToJson(KontakDataModel data) => json.encode(data.toJson());

class KontakDataModel {
  KontakDataModel({
    required this.code,
    required this.kontak,
    required this.total,
  });

  int code;
  List<Kontak> kontak;
  int total;

  factory KontakDataModel.fromJson(Map<String, dynamic> json) => KontakDataModel(
    code: json["code"],
    kontak: List<Kontak>.from(json["data"].map((x) => Kontak.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "kontak": List<dynamic>.from(kontak.map((x) => x.toJson())),
    "total": total
  };
}

class Kontak {
  Kontak({
    required this.id,
    required this.adminId,
    required this.namainstansi,
    required this.nomortelepon,
    required this.alamat,
    required this.jenisinstansi,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  int adminId;
  String namainstansi;
  String nomortelepon;
  String alamat;
  String jenisinstansi;
  // String createdAt;
  // String updatedAt;

  factory Kontak.fromJson(Map<String, dynamic> json) => Kontak(
    id: json["id"],
    adminId: json["admin_id"],
    namainstansi: json["namainstansi"],
    nomortelepon: json["nomortelepon"],
    alamat: json["alamat"],
    jenisinstansi: json["jenisinstansi"],
    // createdAt: json["createdAt"],
    // updatedAt: json["updatedAt"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "namainstansi": namainstansi,
    "nomortelepon": nomortelepon,
    "alamat": alamat,
    "jenisinstansi":jenisinstansi,
    // "createdAt": createdAt,
    // "updatedAt": updatedAt
  };
}