import 'profile.dart';

class UserProfileResponse {
  final String? responseType;
  final String? responseCode;
  final String? responseMessage;
  final String? responseProvider;
  final Profile? profile;
  final num? actionType;

  UserProfileResponse({
    this.responseType,
    this.responseCode,
    this.responseMessage,
    this.responseProvider,
    this.profile,
    this.actionType,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      UserProfileResponse(
        responseType: json["ResponseType"],
        responseCode: json["ResponseCode"],
        responseMessage: json["ResponseMessage"],
        responseProvider: json["ResponseProvider"],
        profile: json["ResponseData"] == null
            ? null
            : Profile.fromJson(json["ResponseData"]),
        actionType: json["ActionType"],
      );

  Map<String, dynamic> toJson() => {
        "ResponseType": responseType,
        "ResponseCode": responseCode,
        "ResponseMessage": responseMessage,
        "ResponseProvider": responseProvider,
        "ResponseData": profile?.toJson(),
        "ActionType": actionType,
      };
}

