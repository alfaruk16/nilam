class BargainResponse {
  final String? responseType;
  final String? responseCode;
  final String? responseMessage;
  final String? responseProvider;
  final ResponseData? responseData;
  final int? actionType;

  BargainResponse({
    this.responseType,
    this.responseCode,
    this.responseMessage,
    this.responseProvider,
    this.responseData,
    this.actionType,
  });

  factory BargainResponse.fromJson(Map<String, dynamic> json) =>
      BargainResponse(
        responseType: json["ResponseType"],
        responseCode: json["ResponseCode"],
        responseMessage: json["ResponseMessage"],
        responseProvider: json["ResponseProvider"],
        responseData: json["ResponseData"] == null
            ? null
            : ResponseData.fromJson(json["ResponseData"]),
        actionType: json["ActionType"],
      );

  Map<String, dynamic> toJson() => {
        "ResponseType": responseType,
        "ResponseCode": responseCode,
        "ResponseMessage": responseMessage,
        "ResponseProvider": responseProvider,
        "ResponseData": responseData?.toJson(),
        "ActionType": actionType,
      };
}

class ResponseData {
  final int? id;
  final int? userId;
  final int? itemId;
  final dynamic type;
  final dynamic itemName;
  final dynamic imageUrl;
  final int? sellerId;
  final num? quantity;
  final num? bargainFactor;
  final int? lastBuyerAmount;
  final String? lastBuyerMessage;
  final DateTime? lastBargainAt;
  final int? lastSellerAmount;
  final String? lastSellerMessage;
  final dynamic orderConfirmAt;
  final dynamic orderId;
  final int? controlledBy;
  final String? status;
  final List<BargainDetail>? bargainDetails;
  final String? slug;

  ResponseData({
    this.id,
    this.userId,
    this.itemId,
    this.type,
    this.itemName,
    this.imageUrl,
    this.sellerId,
    this.quantity,
    this.bargainFactor,
    this.lastBuyerAmount,
    this.lastBuyerMessage,
    this.lastBargainAt,
    this.lastSellerAmount,
    this.lastSellerMessage,
    this.orderConfirmAt,
    this.orderId,
    this.controlledBy,
    this.status,
    this.bargainDetails,
    this.slug,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        id: json["Id"],
        userId: json["UserId"],
        itemId: json["ItemId"],
        type: json["Type"],
        itemName: json["ItemName"],
        imageUrl: json["ImageUrl"],
        sellerId: json["SellerId"],
        quantity: json["Quantity"],
        bargainFactor: json["BargainFactor"],
        lastBuyerAmount: json["LastBuyerAmount"],
        lastBuyerMessage: json["LastBuyerMessage"],
        lastBargainAt: json["LastBargainAt"] == null
            ? null
            : DateTime.parse(json["LastBargainAt"]),
        lastSellerAmount: json["LastSellerAmount"],
        lastSellerMessage: json["LastSellerMessage"],
        orderConfirmAt: json["OrderConfirmAt"],
        orderId: json["OrderId"],
        controlledBy: json["ControlledBy"],
        status: json["Status"],
        bargainDetails: json["BargainDetails"] == null
            ? []
            : List<BargainDetail>.from(
                json["BargainDetails"]!.map((x) => BargainDetail.fromJson(x))),
        slug: json["Slug"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "ItemId": itemId,
        "Type": type,
        "ItemName": itemName,
        "ImageUrl": imageUrl,
        "SellerId": sellerId,
        "Quantity": quantity,
        "BargainFactor": bargainFactor,
        "LastBuyerAmount": lastBuyerAmount,
        "LastBuyerMessage": lastBuyerMessage,
        "LastBargainAt": lastBargainAt?.toIso8601String(),
        "LastSellerAmount": lastSellerAmount,
        "LastSellerMessage": lastSellerMessage,
        "OrderConfirmAt": orderConfirmAt,
        "OrderId": orderId,
        "ControlledBy": controlledBy,
        "Status": status,
        "BargainDetails": bargainDetails == null
            ? []
            : List<dynamic>.from(bargainDetails!.map((x) => x.toJson())),
        "Slug": slug,
      };
}

class BargainDetail {
  final int? id;
  final int? bargainId;
  final int? userId;
  final dynamic parentId;
  final DateTime? bargainAt;
  final int? amount;
  final String? message;
  final bool? isAccepted;
  final int? sequence;
  final bool? isLastStep;
  final String? bargainLimitMessage;

  BargainDetail({
    this.id,
    this.bargainId,
    this.userId,
    this.parentId,
    this.bargainAt,
    this.amount,
    this.message,
    this.isAccepted,
    this.sequence,
    this.isLastStep,
    this.bargainLimitMessage,
  });

  factory BargainDetail.fromJson(Map<String, dynamic> json) => BargainDetail(
        id: json["Id"],
        bargainId: json["BargainId"],
        userId: json["UserId"],
        parentId: json["ParentId"],
        bargainAt: json["BargainAt"] == null
            ? null
            : DateTime.parse(json["BargainAt"]),
        amount: json["Amount"],
        message: json["Message"],
        isAccepted: json["IsAccepted"],
        sequence: json["Sequence"],
        isLastStep: json["IsLastStep"],
        bargainLimitMessage: json["BargainLimitMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "BargainId": bargainId,
        "UserId": userId,
        "ParentId": parentId,
        "BargainAt": bargainAt?.toIso8601String(),
        "Amount": amount,
        "Message": message,
        "IsAccepted": isAccepted,
        "Sequence": sequence,
        "IsLastStep": isLastStep,
        "BargainLimitMessage": bargainLimitMessage,
      };
}
