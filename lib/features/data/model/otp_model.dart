class OtpModel {
  final String username;

  OtpModel({
    required this.username,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}

class ValidateOtpModel {
  final String username;
  final String otp;

  ValidateOtpModel({
    required this.username,
    required this.otp,
  });

  factory ValidateOtpModel.fromJson(Map<String, dynamic> json) =>
      ValidateOtpModel(
        username: json["username"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "otp": otp,
      };
}
