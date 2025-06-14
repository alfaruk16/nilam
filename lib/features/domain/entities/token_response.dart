class TokenResponse {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? user;
  final String? responseMessage;
  final String? responseType;
  final String? responseCode;
  final String? responseProvider;

  const TokenResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.user,
    this.responseMessage,
    this.responseType,
    this.responseCode,
    this.responseProvider,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    user: json["User"],
    responseMessage: json["ResponseMessage"],
    responseType: json["ResponseType"],
    responseCode: json["ResponseCode"],
    responseProvider: json["ResponseProvider"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "User": user,
    "ResponseMessage": responseMessage,
    "ResponseType": responseType,
    "ResponseCode": responseCode,
    "ResponseProvider": responseProvider,
  };
}
