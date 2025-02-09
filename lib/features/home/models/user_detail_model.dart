import 'dart:convert';

MUserDetails mUserDetailsFromJson(String str) => MUserDetails.fromJson(json.decode(str));

class MUserDetails {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final int? otp;
  final String? image;
  final String? gender;
  final int? otpExpiresAt;
  final String? emailProofToken;
  final int? emailProofTokenExpiresAt;
  final String? passwordResetToken;
  final int? passwordResetTokenExpiresAt;
  final int? period;
  final int? cycle;
  final String? platform;
  final bool? isVerified;
  final bool? isFake;
  final int? createdAt;
  final int? updatedAt;

  MUserDetails({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.otp,
    this.image,
    this.gender,
    this.otpExpiresAt,
    this.emailProofToken,
    this.emailProofTokenExpiresAt,
    this.passwordResetToken,
    this.passwordResetTokenExpiresAt,
    this.period,
    this.cycle,
    this.platform,
    this.isVerified,
    this.isFake,
    this.createdAt,
    this.updatedAt,
  });

  factory MUserDetails.fromJson(Map<String, dynamic> json) => MUserDetails(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        otp: json["otp"],
        image: json["image"],
        gender: json["gender"],
        otpExpiresAt: json["otpExpiresAt"],
        emailProofToken: json["emailProofToken"],
        emailProofTokenExpiresAt: json["emailProofTokenExpiresAt"],
        passwordResetToken: json["passwordResetToken"],
        passwordResetTokenExpiresAt: json["passwordResetTokenExpiresAt"],
        period: json["period"],
        cycle: json["cycle"],
        platform: json["platform"],
        isVerified: json["isVerified"],
        isFake: json["isFake"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}
