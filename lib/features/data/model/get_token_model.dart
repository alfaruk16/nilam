class GetTokenModel {
  final String grantType;
  final String clientId;
  final String clientSecret;
  final int offset;

  GetTokenModel({
    this.grantType = "client_credentials",
    this.clientId = "MASTER_CLIENT",
    this.clientSecret = "MASTER_CLIENT_9520943DC26494F8941B",
    required this.offset,
  });

  factory GetTokenModel.fromJson(Map<String, dynamic> json) => GetTokenModel(
        grantType: json["grant_type"],
        clientId: json["client_id"],
        clientSecret: json["client_secret"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "grant_type": grantType,
        "client_id": clientId,
        "client_secret": clientSecret,
        "offset": offset,
      };
}
