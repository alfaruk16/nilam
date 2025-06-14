class BargainInfoResponse {
  final Item? item;
  final Bargain? bargain;
  final List<Detail>? details;
  final dynamic buyers;
  final bool? isOwner;
  final Selected? selected;

  const BargainInfoResponse({
    this.item,
    this.bargain,
    this.details,
    this.buyers,
    this.isOwner,
    this.selected,
  });

  factory BargainInfoResponse.fromJson(Map<String, dynamic> json) =>
      BargainInfoResponse(
        item: json["Item"] == null ? null : Item.fromJson(json["Item"]),
        bargain:
            json["Bargain"] == null ? null : Bargain.fromJson(json["Bargain"]),
        details: json["Details"] == null
            ? []
            : List<Detail>.from(
                json["Details"]!.map((x) => Detail.fromJson(x))),
        buyers: json["Buyers"],
        isOwner: json["IsOwner"],
        selected: json["Selected"] == null
            ? null
            : Selected.fromJson(json["Selected"]),
      );

  Map<String, dynamic> toJson() => {
        "Item": item?.toJson(),
        "Bargain": bargain?.toJson(),
        "Details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
        "Buyers": buyers,
        "IsOwner": isOwner,
        "Selected": selected?.toJson(),
      };
}

class Bargain {
  final int? id;
  final int? userId;
  final int? itemId;
  final dynamic type;
  final dynamic itemName;
  final dynamic imageUrl;
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
  final int? controlledBy;
  final String? status;
  final dynamic bargainDetails;
  final String? slug;

  Bargain({
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

  factory Bargain.fromJson(Map<String, dynamic> json) => Bargain(
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

class Detail {
  final int? id;
  final int? bargainId;
  final int? userId;
  final dynamic parentId;
  final DateTime? bargainAt;
  final num? amount;
  final String? message;
  final bool? isAccepted;
  final int? sequence;
  final bool? isLastStep;
  final dynamic bargainLimitMessage;

  Detail({
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

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
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

class Item {
  final int? id;
  final int? itemId;
  final int? userId;
  final String? itemName;
  final String? stockType;
  final String? saleType;
  final num? salesPrice;
  final int? imageId;
  final String? imageUrl;
  final String? measurementName;
  final num? stockQuantity;
  final int? cartQuantity;
  final dynamic cartType;
  final int? bargainId;
  final String? slug;

  Item({
    this.id,
    this.itemId,
    this.userId,
    this.itemName,
    this.stockType,
    this.saleType,
    this.salesPrice,
    this.imageId,
    this.imageUrl,
    this.measurementName,
    this.stockQuantity,
    this.cartQuantity,
    this.cartType,
    this.bargainId,
    this.slug,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["Id"],
        itemId: json["ItemId"],
        userId: json["UserId"],
        itemName: json["ItemName"],
        stockType: json["StockType"],
        saleType: json["SaleType"],
        salesPrice: json["SalesPrice"],
        imageId: json["ImageId"],
        imageUrl: json["ImageUrl"],
        measurementName: json["MeasurementName"],
        stockQuantity: json["StockQuantity"],
        cartQuantity: json["CartQuantity"],
        cartType: json["CartType"],
        bargainId: json["BargainId"],
        slug: json["Slug"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ItemId": itemId,
        "UserId": userId,
        "ItemName": itemName,
        "StockType": stockType,
        "SaleType": saleType,
        "SalesPrice": salesPrice,
        "ImageId": imageId,
        "ImageUrl": imageUrl,
        "MeasurementName": measurementName,
        "StockQuantity": stockQuantity,
        "CartQuantity": cartQuantity,
        "CartType": cartType,
        "BargainId": bargainId,
        "Slug": slug,
      };
}

class Selected {
  final int? id;
  final String? name;
  final dynamic message;
  final dynamic messageAt;
  final dynamic profileImageUrl;
  final int? bargainId;
  final int? sequence;
  final int? bargainStepLimit;
  final String? bargainLimitMessage;

  Selected({
    this.id,
    this.name,
    this.message,
    this.messageAt,
    this.profileImageUrl,
    this.bargainId,
    this.sequence,
    this.bargainStepLimit,
    this.bargainLimitMessage,
  });

  factory Selected.fromJson(Map<String, dynamic> json) => Selected(
        id: json["Id"],
        name: json["Name"],
        message: json["Message"],
        messageAt: json["MessageAt"],
        profileImageUrl: json["ProfileImageUrl"],
        bargainId: json["BargainId"],
        sequence: json["Sequence"],
        bargainStepLimit: json["BargainStepLimit"],
        bargainLimitMessage: json["BargainLimitMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Message": message,
        "MessageAt": messageAt,
        "ProfileImageUrl": profileImageUrl,
        "BargainId": bargainId,
        "Sequence": sequence,
        "BargainStepLimit": bargainStepLimit,
        "BargainLimitMessage": bargainLimitMessage,
      };
}
