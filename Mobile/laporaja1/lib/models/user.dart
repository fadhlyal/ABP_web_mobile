import 'dart:convert';

UserDataModel dataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String dataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    required this.code,
    required this.users,
    // required this.total,
  });

  int code;
  User users;
  // int total;


  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    code: json["code"],
    users: User.fromJson(json["data"]),
    // total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "users": users.toJson(),
    // "total": total
  };
}

class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.provinsi,
    required this.kabkota,
    required this.kecamatan,
    required this.email,
    required this.role
  });

  int id;
  String firstname;
  String lastname;
  String phonenumber;
  String provinsi;
  String kabkota;
  String kecamatan;
  String email;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    phonenumber: json["phonenumber"],
    provinsi: json["provinsi"],
    kabkota: json["kabkota"],
    kecamatan: json["kecamatan"],
    email: json["email"],
    role: json["role"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "phonenumber": phonenumber,
    "provinsi": provinsi,
    "kabkota": kabkota,
    "kecamatan": kecamatan,
    "email": email,
    "role": role
  };
}