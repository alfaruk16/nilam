class CancelBargainResponse {
  final String? responseType;
  final String? responseCode;
  final String? responseMessage;
  final String? responseProvider;
  final dynamic responseData;
  final int? actionType;

  CancelBargainResponse({
    this.responseType,
    this.responseCode,
    this.responseMessage,
    this.responseProvider,
    this.responseData,
    this.actionType,
  });

  factory CancelBargainResponse.fromJson(Map<String, dynamic> json) =>
      CancelBargainResponse(
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
