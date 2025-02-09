// To parse this JSON data, do
//
//     final mSignIn = mSignInFromJson(jsonString);

import 'dart:convert';

MSignIn mSignInFromJson(String str) => MSignIn.fromJson(json.decode(str));

String mSignInToJson(MSignIn data) => json.encode(data.toJson());

class MSignIn {
  final int? expiresIn;
  final String? token;
  final User? user;
  final int? status;

  MSignIn({
    this.expiresIn,
    this.token,
    this.user,
    this.status,
  });

  factory MSignIn.fromJson(Map<String, dynamic> json) => MSignIn(
        expiresIn: json["expiresIn"],
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "expiresIn": expiresIn,
        "token": token,
        "user": user?.toJson(),
        "status": status,
      };
}

class User {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final DateTime? dob;
  final int? period;
  final String? platform;
  final int? cycle;
  final dynamic city;
  final dynamic country;
  final dynamic address;
  final bool? isActive;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.dob,
    this.period,
    this.platform,
    this.cycle,
    this.city,
    this.country,
    this.address,
    this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        period: json["period"],
        platform: json["platform"],
        cycle: json["cycle"],
        city: json["city"],
        country: json["country"],
        address: json["address"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "period": period,
        "platform": platform,
        "cycle": cycle,
        "city": city,
        "country": country,
        "address": address,
        "isActive": isActive,
      };
}
