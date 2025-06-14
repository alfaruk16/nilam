class OrderDetailsResponse {
  final Order? order;
  final List<OrderPackage>? orderPackages;
  final List<dynamic>? documents;
  final Message? message;
  final List<Activity>? activities;

  const OrderDetailsResponse({
    this.order,
    this.orderPackages,
    this.documents,
    this.message,
    this.activities,
  });

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      OrderDetailsResponse(
        order: json["Order"] == null ? null : Order.fromJson(json["Order"]),
        orderPackages: json["OrderPackages"] == null
            ? []
            : List<OrderPackage>.from(
                json["OrderPackages"]!.map((x) => OrderPackage.fromJson(x))),
        documents: json["Documents"] == null
            ? []
            : List<dynamic>.from(json["Documents"]!.map((x) => x)),
        message:
            json["Message"] == null ? null : Message.fromJson(json["Message"]),
        activities: json["Activities"] == null
            ? []
            : List<Activity>.from(
                json["Activities"]!.map((x) => Activity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Order": order?.toJson(),
        "OrderPackages": orderPackages == null
            ? []
            : List<dynamic>.from(orderPackages!.map((x) => x.toJson())),
        "Documents": documents == null
            ? []
            : List<dynamic>.from(documents!.map((x) => x)),
        "Message": message?.toJson(),
        "Activities": activities == null
            ? []
            : List<dynamic>.from(activities!.map((x) => x.toJson())),
      };
}

class Activity {
  final int? userId;
  final dynamic userName;
  final dynamic userProfileImageUrl;
  final int? orderId;
  final dynamic packageId;
  final dynamic toUserId;
  final dynamic proxyId;
  final dynamic type;
  final DateTime? activityAt;
  final String? activity;
  final bool? isApproved;
  final dynamic status;

  Activity({
    this.userId,
    this.userName,
    this.userProfileImageUrl,
    this.orderId,
    this.packageId,
    this.toUserId,
    this.proxyId,
    this.type,
    this.activityAt,
    this.activity,
    this.isApproved,
    this.status,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        userId: json["UserId"],
        userName: json["UserName"],
        userProfileImageUrl: json["UserProfileImageUrl"],
        orderId: json["OrderId"],
        packageId: json["PackageId"],
        toUserId: json["ToUserId"],
        proxyId: json["ProxyId"],
        type: json["Type"],
        activityAt: json["ActivityAt"] == null
            ? null
            : DateTime.parse(json["ActivityAt"]),
        activity: json["Activity"],
        isApproved: json["IsApproved"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "UserName": userName,
        "UserProfileImageUrl": userProfileImageUrl,
        "OrderId": orderId,
        "PackageId": packageId,
        "ToUserId": toUserId,
        "ProxyId": proxyId,
        "Type": type,
        "ActivityAt": activityAt?.toIso8601String(),
        "Activity": activity,
        "IsApproved": isApproved,
        "Status": status,
      };
}

class Message {
  final String? responseType;
  final String? responseCode;
  final String? responseMessage;
  final String? responseProvider;
  final dynamic responseData;
  final num? actionType;

  Message({
    this.responseType,
    this.responseCode,
    this.responseMessage,
    this.responseProvider,
    this.responseData,
    this.actionType,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
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

class Order {
  final int? id;
  final String? displayId;
  final int? buyerId;
  final int? sellerId;
  final int? shippingAddressId;
  final int? billingAddressId;
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
  final dynamic orderNote;
  final String? shippedBy;
  final String? paymentStatus;
  final String? paymentMode;
  final dynamic paymentNote;
  final bool? isAvailEmi;
  final num? downPayment;
  final dynamic stateStatus;
  final num? processingFee;
  final num? gatewayChargeAmount;
  final bool? isApiUrl;
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
  final IngAddress? shippingAddress;
  final IngAddress? billingAddress;
  final dynamic seller;
  final Buyer? buyer;

  Order({
    this.id,
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
    this.orderNote,
    this.shippedBy,
    this.paymentStatus,
    this.paymentMode,
    this.paymentNote,
    this.isAvailEmi,
    this.downPayment,
    this.stateStatus,
    this.processingFee,
    this.gatewayChargeAmount,
    this.isApiUrl,
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
    this.shippingAddress,
    this.billingAddress,
    this.seller,
    this.buyer,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["Id"],
        displayId: json["DisplayId"],
        buyerId: json["BuyerId"],
        sellerId: json["SellerId"],
        shippingAddressId: json["ShippingAddressId"],
        billingAddressId: json["BillingAddressId"],
        orderedAt: json["OrderedAt"] == null
            ? null
            : DateTime.parse(json["OrderedAt"]),
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
        orderNote: json["OrderNote"],
        shippedBy: json["ShippedBy"],
        paymentStatus: json["PaymentStatus"],
        paymentMode: json["PaymentMode"],
        paymentNote: json["PaymentNote"],
        isAvailEmi: json["IsAvailEmi"],
        downPayment: json["DownPayment"],
        stateStatus: json["StateStatus"],
        processingFee: json["ProcessingFee"],
        gatewayChargeAmount: json["GatewayChargeAmount"],
        isApiUrl: json["IsApiUrl"],
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
        shippingAddress: json["ShippingAddress"] == null
            ? null
            : IngAddress.fromJson(json["ShippingAddress"]),
        billingAddress: json["BillingAddress"] == null
            ? null
            : IngAddress.fromJson(json["BillingAddress"]),
        seller: json["Seller"],
        buyer: json["Buyer"] == null ? null : Buyer.fromJson(json["Buyer"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
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
        "OrderNote": orderNote,
        "ShippedBy": shippedBy,
        "PaymentStatus": paymentStatus,
        "PaymentMode": paymentMode,
        "PaymentNote": paymentNote,
        "IsAvailEmi": isAvailEmi,
        "DownPayment": downPayment,
        "StateStatus": stateStatus,
        "ProcessingFee": processingFee,
        "GatewayChargeAmount": gatewayChargeAmount,
        "IsApiUrl": isApiUrl,
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
        "ShippingAddress": shippingAddress?.toJson(),
        "BillingAddress": billingAddress?.toJson(),
        "Seller": seller,
        "Buyer": buyer?.toJson(),
      };
}

class IngAddress {
  final int? id;
  final String? title;
  final String? name;
  final dynamic type;
  final String? email;
  final String? mobile;
  final dynamic countryCode;
  final int? divisionId;
  final int? districtId;
  final dynamic thanaId;
  final dynamic unionId;
  final String? address1;
  final dynamic address2;
  final dynamic placeId;
  final dynamic latitude;
  final dynamic longitude;
  final bool? isDefault;
  final bool? isPickupPoint;
  final dynamic divisionName;
  final dynamic districtName;
  final dynamic thanaName;
  final dynamic unionName;
  final Info? districtInfo;
  final Info? divisionInfo;

  IngAddress({
    this.id,
    this.title,
    this.name,
    this.type,
    this.email,
    this.mobile,
    this.countryCode,
    this.divisionId,
    this.districtId,
    this.thanaId,
    this.unionId,
    this.address1,
    this.address2,
    this.placeId,
    this.latitude,
    this.longitude,
    this.isDefault,
    this.isPickupPoint,
    this.divisionName,
    this.districtName,
    this.thanaName,
    this.unionName,
    this.districtInfo,
    this.divisionInfo,
  });

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
        id: json["Id"],
        title: json["Title"],
        name: json["Name"],
        type: json["Type"],
        email: json["Email"],
        mobile: json["Mobile"],
        countryCode: json["CountryCode"],
        divisionId: json["DivisionId"],
        districtId: json["DistrictId"],
        thanaId: json["ThanaId"],
        unionId: json["UnionId"],
        address1: json["Address1"],
        address2: json["Address2"],
        placeId: json["PlaceId"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        isDefault: json["IsDefault"],
        isPickupPoint: json["IsPickupPoint"],
        divisionName: json["DivisionName"],
        districtName: json["DistrictName"],
        thanaName: json["ThanaName"],
        unionName: json["UnionName"],
        districtInfo: json["DistrictInfo"] == null
            ? null
            : Info.fromJson(json["DistrictInfo"]),
        divisionInfo: json["DivisionInfo"] == null
            ? null
            : Info.fromJson(json["DivisionInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Title": title,
        "Name": name,
        "Type": type,
        "Email": email,
        "Mobile": mobile,
        "CountryCode": countryCode,
        "DivisionId": divisionId,
        "DistrictId": districtId,
        "ThanaId": thanaId,
        "UnionId": unionId,
        "Address1": address1,
        "Address2": address2,
        "PlaceId": placeId,
        "Latitude": latitude,
        "Longitude": longitude,
        "IsDefault": isDefault,
        "IsPickupPoint": isPickupPoint,
        "DivisionName": divisionName,
        "DistrictName": districtName,
        "ThanaName": thanaName,
        "UnionName": unionName,
        "DistrictInfo": districtInfo?.toJson(),
        "DivisionInfo": divisionInfo?.toJson(),
      };
}

class Info {
  final int? id;
  final int? divisionId;
  final String? name;
  final dynamic nameBn;
  final dynamic latitude;
  final dynamic longitude;
  final bool? isOperational;
  final num? deliveryCharge;
  final String? status;
  final int? countryId;

  Info({
    this.id,
    this.divisionId,
    this.name,
    this.nameBn,
    this.latitude,
    this.longitude,
    this.isOperational,
    this.deliveryCharge,
    this.status,
    this.countryId,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["Id"],
        divisionId: json["DivisionId"],
        name: json["Name"],
        nameBn: json["NameBN"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        isOperational: json["IsOperational"],
        deliveryCharge: json["DeliveryCharge"],
        status: json["Status"],
        countryId: json["CountryId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DivisionId": divisionId,
        "Name": name,
        "NameBN": nameBn,
        "Latitude": latitude,
        "Longitude": longitude,
        "IsOperational": isOperational,
        "DeliveryCharge": deliveryCharge,
        "Status": status,
        "CountryId": countryId,
      };
}

class Buyer {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? email;
  final String? mobile;
  final dynamic address1;
  final dynamic address2;

  Buyer({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.mobile,
    this.address1,
    this.address2,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        fullName: json["FullName"],
        email: json["Email"],
        mobile: json["Mobile"],
        address1: json["Address1"],
        address2: json["Address2"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "FullName": fullName,
        "Email": email,
        "Mobile": mobile,
        "Address1": address1,
        "Address2": address2,
      };
}

class OrderPackage {
  final int? id;
  final int? orderId;
  final String? displayId;
  final int? buyerId;
  final int? sellerId;
  final int? shippingAddressId;
  final int? billingAddressId;
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
  final String? orderNote;
  final String? shippedBy;
  final String? paymentStatus;
  final String? paymentMode;
  final dynamic paymentNote;
  final dynamic paymentInfo;
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
  final IngAddress? shippingAddress;
  final IngAddress? billingAddress;
  final Buyer? seller;
  final List<ItemDetail>? itemDetails;
  final List<dynamic>? activities;

  OrderPackage({
    this.id,
    this.orderId,
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
    this.orderNote,
    this.shippedBy,
    this.paymentStatus,
    this.paymentMode,
    this.paymentNote,
    this.paymentInfo,
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
    this.shippingAddress,
    this.billingAddress,
    this.seller,
    this.itemDetails,
    this.activities,
  });

  factory OrderPackage.fromJson(Map<String, dynamic> json) => OrderPackage(
        id: json["Id"],
        orderId: json["OrderId"],
        displayId: json["DisplayId"],
        buyerId: json["BuyerId"],
        sellerId: json["SellerId"],
        shippingAddressId: json["ShippingAddressId"],
        billingAddressId: json["BillingAddressId"],
        orderedAt: json["OrderedAt"] == null
            ? null
            : DateTime.parse(json["OrderedAt"]),
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
        orderNote: json["OrderNote"],
        shippedBy: json["ShippedBy"],
        paymentStatus: json["PaymentStatus"],
        paymentMode: json["PaymentMode"],
        paymentNote: json["PaymentNote"],
        paymentInfo: json["PaymentInfo"],
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
        shippingAddress: json["ShippingAddress"] == null
            ? null
            : IngAddress.fromJson(json["ShippingAddress"]),
        billingAddress: json["BillingAddress"] == null
            ? null
            : IngAddress.fromJson(json["BillingAddress"]),
        seller: json["Seller"] == null ? null : Buyer.fromJson(json["Seller"]),
        itemDetails: json["ItemDetails"] == null
            ? []
            : List<ItemDetail>.from(
                json["ItemDetails"]!.map((x) => ItemDetail.fromJson(x))),
        activities: json["Activities"] == null
            ? []
            : List<dynamic>.from(json["Activities"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "OrderId": orderId,
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
        "OrderNote": orderNote,
        "ShippedBy": shippedBy,
        "PaymentStatus": paymentStatus,
        "PaymentMode": paymentMode,
        "PaymentNote": paymentNote,
        "PaymentInfo": paymentInfo,
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
        "ShippingAddress": shippingAddress?.toJson(),
        "BillingAddress": billingAddress?.toJson(),
        "Seller": seller?.toJson(),
        "ItemDetails": itemDetails == null
            ? []
            : List<dynamic>.from(itemDetails!.map((x) => x.toJson())),
        "Activities": activities == null
            ? []
            : List<dynamic>.from(activities!.map((x) => x)),
      };
}

class ItemDetail {
  final int? id;
  final int? orderId;
  final int? sequence;
  final String? itemName;
  final String? condition;
  final String? imageUrl;
  final String? measurementName;
  final int? itemId;
  final dynamic sku;
  final dynamic attributes;
  final int? sellerId;
  final int? measurementId;
  final num? quantity;
  final num? freeQuantity;
  final num? returnQuantity;
  final num? costPrice;
  final num? salesPrice;
  final num? chargeAmount;
  final num? discountAmount;
  final num? shippingCharge;
  final num? netTotal;
  final num? netCostTotal;
  final dynamic remarks;
  final bool? isLocked;
  final bool? isVendorPaid;
  final dynamic reviews;
  final Buyer? seller;
  final String? slug;

  ItemDetail({
    this.id,
    this.orderId,
    this.sequence,
    this.itemName,
    this.condition,
    this.imageUrl,
    this.measurementName,
    this.itemId,
    this.sku,
    this.attributes,
    this.sellerId,
    this.measurementId,
    this.quantity,
    this.freeQuantity,
    this.returnQuantity,
    this.costPrice,
    this.salesPrice,
    this.chargeAmount,
    this.discountAmount,
    this.shippingCharge,
    this.netTotal,
    this.netCostTotal,
    this.remarks,
    this.isLocked,
    this.isVendorPaid,
    this.reviews,
    this.seller,
    this.slug,
  });

  factory ItemDetail.fromJson(Map<String, dynamic> json) => ItemDetail(
        id: json["Id"],
        orderId: json["OrderId"],
        sequence: json["Sequence"],
        itemName: json["ItemName"],
        condition: json["Condition"],
        imageUrl: json["ImageUrl"],
        measurementName: json["MeasurementName"],
        itemId: json["ItemId"],
        sku: json["SKU"],
        attributes: json["Attributes"],
        sellerId: json["SellerId"],
        measurementId: json["MeasurementId"],
        quantity: json["Quantity"],
        freeQuantity: json["FreeQuantity"],
        returnQuantity: json["ReturnQuantity"],
        costPrice: json["CostPrice"],
        salesPrice: json["SalesPrice"],
        chargeAmount: json["ChargeAmount"],
        discountAmount: json["DiscountAmount"],
        shippingCharge: json["ShippingCharge"],
        netTotal: json["NetTotal"],
        netCostTotal: json["NetCostTotal"],
        remarks: json["Remarks"],
        isLocked: json["IsLocked"],
        isVendorPaid: json["IsVendorPaid"],
        reviews: json["Reviews"],
        seller: json["Seller"] == null ? null : Buyer.fromJson(json["Seller"]),
        slug: json["Slug"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "OrderId": orderId,
        "Sequence": sequence,
        "ItemName": itemName,
        "Condition": condition,
        "ImageUrl": imageUrl,
        "MeasurementName": measurementName,
        "ItemId": itemId,
        "SKU": sku,
        "Attributes": attributes,
        "SellerId": sellerId,
        "MeasurementId": measurementId,
        "Quantity": quantity,
        "FreeQuantity": freeQuantity,
        "ReturnQuantity": returnQuantity,
        "CostPrice": costPrice,
        "SalesPrice": salesPrice,
        "ChargeAmount": chargeAmount,
        "DiscountAmount": discountAmount,
        "ShippingCharge": shippingCharge,
        "NetTotal": netTotal,
        "NetCostTotal": netCostTotal,
        "Remarks": remarks,
        "IsLocked": isLocked,
        "IsVendorPaid": isVendorPaid,
        "Reviews": reviews,
        "Seller": seller?.toJson(),
        "Slug": slug,
      };
}
