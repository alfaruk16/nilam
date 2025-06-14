class SignUpModel {
  final String firstName;
  final String lastName;
  final String? email;
  final String password;
  final String confirmPassword;
  final String countryCode;
  final String mobileNumber;
  final String clientId;
  final String clientSecret;
  final String grantType;
  final int offset;

  const SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.countryCode,
    required this.mobileNumber,
    required this.clientId,
    required this.clientSecret,
    required this.grantType,
    required this.offset,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        password: json["Password"],
        confirmPassword: json["ConfirmPassword"],
        countryCode: json["CountryCode"],
        mobileNumber: json["MobileNumber"],
        clientId: json["client_id"],
        clientSecret: json["client_secret"],
        grantType: json["grant_type"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "Password": password,
        "ConfirmPassword": confirmPassword,
        "CountryCode": countryCode,
        "MobileNumber": mobileNumber,
        "client_id": clientId,
        "client_secret": clientSecret,
        "grant_type": grantType,
        "offset": offset,
      };
}
