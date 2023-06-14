import 'dart:convert';

UserDataModel dataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String dataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    required this.code,
    required this.users,
    required this.total,
  });

  int code;
  List<User> users;
  int total;


  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    code: json["code"],
    users: List<User>.from(json["data"].map((x) => User.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
    "total": total
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
    required this.password,
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
  String password;
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
    password: json["password"],
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
    "password": password,
    "role": role
  };
}