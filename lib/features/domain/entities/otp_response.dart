class OtpResponse {
  final String? responseType;
  final String? responseCode;
  final String? responseMessage;
  final String? responseProvider;
  final dynamic responseData;
  final int? actionType;

  OtpResponse({
    this.responseType,
    this.responseCode,
    this.responseMessage,
    this.responseProvider,
    this.responseData,
    this.actionType,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
    responseType: json["ResponseType"],
    responseCode: json["ResponseCode"],
    responseMessage: json["ResponseMessage"],
    responseProvider: json["ResponseProvider"],
    responseData: json["ResponseData"],
    actionType: json["ActionType"],
  );

  Map<String, dynamic> toJson() => {
    "ResponseType": responseType,
    "ResponseCode": responseCode,
    "ResponseMessage": responseMessage,
    "ResponseProvider": responseProvider,
    "ResponseData": responseData,
    "ActionType": actionType,
  };
}
