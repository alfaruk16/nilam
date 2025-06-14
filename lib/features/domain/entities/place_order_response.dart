class PlaceOrderResponse {
  final String? responseType;
  final String? responseCode;
  final String? responseMessage;
  final String? responseProvider;
  final ResponseData? responseData;
  final num? actionType;

  PlaceOrderResponse({
    this.responseType,
    this.responseCode,
    this.responseMessage,
    this.responseProvider,
    this.responseData,
    this.actionType,
  });

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) => PlaceOrderResponse(
    responseType: json["ResponseType"],
    responseCode: json["ResponseCode"],
    responseMessage: json["ResponseMessage"],
    responseProvider: json["ResponseProvider"],
    responseData: json["ResponseData"] == null ? null : ResponseData.fromJson(json["ResponseData"]),
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
  final String? displayId;
  final int? buyerId;
  final dynamic sellerId;
  final num? shippingAddressId;
  final num? billingAddressId;
  final DateTime? orderedAt;
  final dynamic tokenNo;
  final dynamic assignedManagerId;
  final dynamic assignedShipperId;
  final String? orderType;
  final num? netTotalAmount;
  final num? totalChargeAmount;
  final num? totalShippingCharge;
  final dynamic promoCode;
  final dynamic discountId;
  final num? promoAmount;
  final num? specialDiscountAmount;
  final dynamic specialDiscountApprover;
  final dynamic specialDiscountNote;
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
  final num? downPayment;
  final dynamic orderNote;
  final String? shippedBy;
  final dynamic stateStatus;
  final String? paymentStatus;
  final String? paymentMode;
  final dynamic paymentNote;
  final dynamic paymentInfo;
  final bool? isAvailEmi;
  final dynamic confirmedAt;
  final dynamic processingAt;
  final dynamic deliveredAt;
  final dynamic holdAt;
  final dynamic returnedAt;
  final dynamic canceledAt;
  final dynamic canceledBy;
  final dynamic cancellationNote;
  final dynamic accountPostedAt;
  final String? status;
  final num? processingFee;
  final num? gatewayChargeAmount;
  final bool? isApiUrl;
  final dynamic shippingAddress;
  final dynamic billingAddress;
  final int? id;
  final int? tenantId;

  ResponseData({
    this.displayId,
    this.buyerId,
    this.sellerId,
    this.shippingAddressId,
    this.billingAddressId,
    this.orderedAt,
    this.tokenNo,
    this.assignedManagerId,
    this.assignedShipperId,
    this.orderType,
    this.netTotalAmount,
    this.totalChargeAmount,
    this.totalShippingCharge,
    this.promoCode,
    this.discountId,
    this.promoAmount,
    this.specialDiscountAmount,
    this.specialDiscountApprover,
    this.specialDiscountNote,
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
    this.downPayment,
    this.orderNote,
    this.shippedBy,
    this.stateStatus,
    this.paymentStatus,
    this.paymentMode,
    this.paymentNote,
    this.paymentInfo,
    this.isAvailEmi,
    this.confirmedAt,
    this.processingAt,
    this.deliveredAt,
    this.holdAt,
    this.returnedAt,
    this.canceledAt,
    this.canceledBy,
    this.cancellationNote,
    this.accountPostedAt,
    this.status,
    this.processingFee,
    this.gatewayChargeAmount,
    this.isApiUrl,
    this.shippingAddress,
    this.billingAddress,
    this.id,
    this.tenantId,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    displayId: json["DisplayId"],
    buyerId: json["BuyerId"],
    sellerId: json["SellerId"],
    shippingAddressId: json["ShippingAddressId"],
    billingAddressId: json["BillingAddressId"],
    orderedAt: json["OrderedAt"] == null ? null : DateTime.parse(json["OrderedAt"]),
    tokenNo: json["TokenNo"],
    assignedManagerId: json["AssignedManagerId"],
    assignedShipperId: json["AssignedShipperId"],
    orderType: json["OrderType"],
    netTotalAmount: json["NetTotalAmount"],
    totalChargeAmount: json["TotalChargeAmount"],
    totalShippingCharge: json["TotalShippingCharge"],
    promoCode: json["PromoCode"],
    discountId: json["DiscountId"],
    promoAmount: json["PromoAmount"],
    specialDiscountAmount: json["SpecialDiscountAmount"],
    specialDiscountApprover: json["SpecialDiscountApprover"],
    specialDiscountNote: json["SpecialDiscountNote"],
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
    downPayment: json["DownPayment"],
    orderNote: json["OrderNote"],
    shippedBy: json["ShippedBy"],
    stateStatus: json["StateStatus"],
    paymentStatus: json["PaymentStatus"],
    paymentMode: json["PaymentMode"],
    paymentNote: json["PaymentNote"],
    paymentInfo: json["PaymentInfo"],
    isAvailEmi: json["IsAvailEmi"],
    confirmedAt: json["ConfirmedAt"],
    processingAt: json["ProcessingAt"],
    deliveredAt: json["DeliveredAt"],
    holdAt: json["HoldAt"],
    returnedAt: json["ReturnedAt"],
    canceledAt: json["CanceledAt"],
    canceledBy: json["CanceledBy"],
    cancellationNote: json["CancellationNote"],
    accountPostedAt: json["AccountPostedAt"],
    status: json["Status"],
    processingFee: json["ProcessingFee"],
    gatewayChargeAmount: json["GatewayChargeAmount"],
    isApiUrl: json["IsApiUrl"],
    shippingAddress: json["ShippingAddress"],
    billingAddress: json["BillingAddress"],
    id: json["Id"],
    tenantId: json["TenantId"],
  );

  Map<String, dynamic> toJson() => {
    "DisplayId": displayId,
    "BuyerId": buyerId,
    "SellerId": sellerId,
    "ShippingAddressId": shippingAddressId,
    "BillingAddressId": billingAddressId,
    "OrderedAt": orderedAt?.toIso8601String(),
    "TokenNo": tokenNo,
    "AssignedManagerId": assignedManagerId,
    "AssignedShipperId": assignedShipperId,
    "OrderType": orderType,
    "NetTotalAmount": netTotalAmount,
    "TotalChargeAmount": totalChargeAmount,
    "TotalShippingCharge": totalShippingCharge,
    "PromoCode": promoCode,
    "DiscountId": discountId,
    "PromoAmount": promoAmount,
    "SpecialDiscountAmount": specialDiscountAmount,
    "SpecialDiscountApprover": specialDiscountApprover,
    "SpecialDiscountNote": specialDiscountNote,
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
    "DownPayment": downPayment,
    "OrderNote": orderNote,
    "ShippedBy": shippedBy,
    "StateStatus": stateStatus,
    "PaymentStatus": paymentStatus,
    "PaymentMode": paymentMode,
    "PaymentNote": paymentNote,
    "PaymentInfo": paymentInfo,
    "IsAvailEmi": isAvailEmi,
    "ConfirmedAt": confirmedAt,
    "ProcessingAt": processingAt,
    "DeliveredAt": deliveredAt,
    "HoldAt": holdAt,
    "ReturnedAt": returnedAt,
    "CanceledAt": canceledAt,
    "CanceledBy": canceledBy,
    "CancellationNote": cancellationNote,
    "AccountPostedAt": accountPostedAt,
    "Status": status,
    "ProcessingFee": processingFee,
    "GatewayChargeAmount": gatewayChargeAmount,
    "IsApiUrl": isApiUrl,
    "ShippingAddress": shippingAddress,
    "BillingAddress": billingAddress,
    "Id": id,
    "TenantId": tenantId,
  };
}
