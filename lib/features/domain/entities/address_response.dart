import 'package:nilam/features/domain/entities/user_address.dart';

class AddressResponse {
  final String? responseType;
  final String? responseCode;
  final String? responseMessage;
  final String? responseProvider;
  final UserAddress? userAddress;
  final int? actionType;

  AddressResponse({
    this.responseType,
    this.responseCode,
    this.responseMessage,
    this.responseProvider,
    this.userAddress,
    this.actionType,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) => AddressResponse(
    responseType: json["ResponseType"],
    responseCode: json["ResponseCode"],
    responseMessage: json["ResponseMessage"],
    responseProvider: json["ResponseProvider"],
    userAddress: json["ResponseData"] == null ? null : UserAddress.fromJson(json["ResponseData"]),
    actionType: json["ActionType"],
  );

  Map<String, dynamic> toJson() => {
    "ResponseType": responseType,
    "ResponseCode": responseCode,
    "ResponseMessage": responseMessage,
    "ResponseProvider": responseProvider,
    "ResponseData": userAddress?.toJson(),
    "ActionType": actionType,
  };
}