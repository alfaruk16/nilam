class MyBargainResponse {
  final num? draw;
  final num? recordsTotal;
  final num? recordsFiltered;
  final List<BargainItem>? data;
  final dynamic error;
  final dynamic partialView;
  final num? page;
  final num? length;
  final num? totalPage;
  final num? otherCount;

  const MyBargainResponse({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
    this.error,
    this.partialView,
    this.page,
    this.length,
    this.totalPage,
    this.otherCount,
  });

  factory MyBargainResponse.fromJson(Map<String, dynamic> json) =>
      MyBargainResponse(
        draw: json["Draw"],
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: json["data"] == null
            ? []
            : List<BargainItem>.from(
                json["data"]!.map((x) => BargainItem.fromJson(x))),
        error: json["Error"],
        partialView: json["PartialView"],
        page: json["Page"],
        length: json["Length"],
        totalPage: json["TotalPage"],
        otherCount: json["OtherCount"],
      );

  Map<String, dynamic> toJson() => {
        "Draw": draw,
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "Error": error,
        "PartialView": partialView,
        "Page": page,
        "Length": length,
        "TotalPage": totalPage,
        "OtherCount": otherCount,
      };
}

class BargainItem {
  final int? id;
  final int? userId;
  final int? itemId;
  final String? type;
  final String? itemName;
  final String? imageUrl;
  final int? sellerId;
  final num? quantity;
  final num? bargainFactor;
  final num? lastBuyerAmount;
  final String? lastBuyerMessage;
  final DateTime? lastBargainAt;
  final num? lastSellerAmount;
  final String? lastSellerMessage;
  final dynamic orderConfirmAt;
  final dynamic orderId;
  final num? controlledBy;
  final String? status;
  final dynamic bargainDetails;
  final String? slug;

  BargainItem({
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

  factory BargainItem.fromJson(Map<String, dynamic> json) => BargainItem(
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
        bargainDetails: json["BargainDetails"],
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
        "BargainDetails": bargainDetails,
        "Slug": slug,
      };
}
