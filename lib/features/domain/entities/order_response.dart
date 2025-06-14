class OrderResponse {
  final int? draw;
  final int? recordsTotal;
  final int? recordsFiltered;
  final List<OrderItem>? data;
  final dynamic error;
  final dynamic partialView;
  final int? page;
  final int? length;
  final int? totalPage;
  final int? otherCount;

  const OrderResponse({
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

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    draw: json["Draw"],
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: json["data"] == null ? [] : List<OrderItem>.from(json["data"]!.map((x) => OrderItem.fromJson(x))),
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
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "Error": error,
    "PartialView": partialView,
    "Page": page,
    "Length": length,
    "TotalPage": totalPage,
    "OtherCount": otherCount,
  };
}

class OrderItem {
  final int? id;
  final String? displayId;
  final int? buyerId;
  final bool? isReceived;
  final int? shippingAddressId;
  final String? name;
  final String? email;
  final String? mobile;
  final String? address1;
  final DateTime? orderedAt;
  final String? orderType;
  final num? netTotalAmount;
  final num? totalChargeAmount;
  final num? totalShippingCharge;
  final num? promoAmount;
  final num? specialDiscountAmount;
  final num? totalDiscountAmount;
  final num? sellerServiceChargeRate;
  final num? sellerServiceCharge;
  final num? buyerServiceChargeRate;
  final num? buyerServiceCharge;
  final num? totalAmount;
  final num? totalReceivedAmount;
  final num? buyerServiceChargeReceived;
  final num? sellerServiceChargeReceived;
  final num? transferToSeller;
  final dynamic orderNote;
  final String? paymentStatus;
  final String? paymentMode;
  final dynamic paymentNote;
  final bool? isAvailEmi;
  final String? shippedBy;
  final dynamic confirmedAt;
  final dynamic processingAt;
  final dynamic deliveredAt;
  final dynamic holdAt;
  final dynamic returnedAt;
  final dynamic canceledAt;
  final String? status;
  final dynamic items;
  final dynamic sellerName;
  final dynamic promoCode;

  OrderItem({
    this.id,
    this.displayId,
    this.buyerId,
    this.isReceived,
    this.shippingAddressId,
    this.name,
    this.email,
    this.mobile,
    this.address1,
    this.orderedAt,
    this.orderType,
    this.netTotalAmount,
    this.totalChargeAmount,
    this.totalShippingCharge,
    this.promoAmount,
    this.specialDiscountAmount,
    this.totalDiscountAmount,
    this.sellerServiceChargeRate,
    this.sellerServiceCharge,
    this.buyerServiceChargeRate,
    this.buyerServiceCharge,
    this.totalAmount,
    this.totalReceivedAmount,
    this.buyerServiceChargeReceived,
    this.sellerServiceChargeReceived,
    this.transferToSeller,
    this.orderNote,
    this.paymentStatus,
    this.paymentMode,
    this.paymentNote,
    this.isAvailEmi,
    this.shippedBy,
    this.confirmedAt,
    this.processingAt,
    this.deliveredAt,
    this.holdAt,
    this.returnedAt,
    this.canceledAt,
    this.status,
    this.items,
    this.sellerName,
    this.promoCode,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json["Id"],
    displayId: json["DisplayId"],
    buyerId: json["BuyerId"],
    isReceived: json["IsReceived"],
    shippingAddressId: json["ShippingAddressId"],
    name: json["Name"],
    email: json["Email"],
    mobile: json["Mobile"],
    address1: json["Address1"],
    orderedAt: json["OrderedAt"] == null ? null : DateTime.parse(json["OrderedAt"]),
    orderType: json["OrderType"],
    netTotalAmount: json["NetTotalAmount"],
    totalChargeAmount: json["TotalChargeAmount"],
    totalShippingCharge: json["TotalShippingCharge"],
    promoAmount: json["PromoAmount"],
    specialDiscountAmount: json["SpecialDiscountAmount"],
    totalDiscountAmount: json["TotalDiscountAmount"],
    sellerServiceChargeRate: json["SellerServiceChargeRate"],
    sellerServiceCharge: json["SellerServiceCharge"],
    buyerServiceChargeRate: json["BuyerServiceChargeRate"],
    buyerServiceCharge: json["BuyerServiceCharge"],
    totalAmount: json["TotalAmount"],
    totalReceivedAmount: json["TotalReceivedAmount"],
    buyerServiceChargeReceived: json["BuyerServiceChargeReceived"],
    sellerServiceChargeReceived: json["SellerServiceChargeReceived"],
    transferToSeller: json["TransferToSeller"],
    orderNote: json["OrderNote"],
    paymentStatus: json["PaymentStatus"],
    paymentMode: json["PaymentMode"],
    paymentNote: json["PaymentNote"],
    isAvailEmi: json["IsAvailEmi"],
    shippedBy: json["ShippedBy"],
    confirmedAt: json["ConfirmedAt"],
    processingAt: json["ProcessingAt"],
    deliveredAt: json["DeliveredAt"],
    holdAt: json["HoldAt"],
    returnedAt: json["ReturnedAt"],
    canceledAt: json["CanceledAt"],
    status: json["Status"],
    items: json["Items"],
    sellerName: json["SellerName"],
    promoCode: json["PromoCode"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DisplayId": displayId,
    "BuyerId": buyerId,
    "IsReceived": isReceived,
    "ShippingAddressId": shippingAddressId,
    "Name": name,
    "Email": email,
    "Mobile": mobile,
    "Address1": address1,
    "OrderedAt": orderedAt?.toIso8601String(),
    "OrderType": orderType,
    "NetTotalAmount": netTotalAmount,
    "TotalChargeAmount": totalChargeAmount,
    "TotalShippingCharge": totalShippingCharge,
    "PromoAmount": promoAmount,
    "SpecialDiscountAmount": specialDiscountAmount,
    "TotalDiscountAmount": totalDiscountAmount,
    "SellerServiceChargeRate": sellerServiceChargeRate,
    "SellerServiceCharge": sellerServiceCharge,
    "BuyerServiceChargeRate": buyerServiceChargeRate,
    "BuyerServiceCharge": buyerServiceCharge,
    "TotalAmount": totalAmount,
    "TotalReceivedAmount": totalReceivedAmount,
    "BuyerServiceChargeReceived": buyerServiceChargeReceived,
    "SellerServiceChargeReceived": sellerServiceChargeReceived,
    "TransferToSeller": transferToSeller,
    "OrderNote": orderNote,
    "PaymentStatus": paymentStatus,
    "PaymentMode": paymentMode,
    "PaymentNote": paymentNote,
    "IsAvailEmi": isAvailEmi,
    "ShippedBy": shippedBy,
    "ConfirmedAt": confirmedAt,
    "ProcessingAt": processingAt,
    "DeliveredAt": deliveredAt,
    "HoldAt": holdAt,
    "ReturnedAt": returnedAt,
    "CanceledAt": canceledAt,
    "Status": status,
    "Items": items,
    "SellerName": sellerName,
    "PromoCode": promoCode,
  };
}
