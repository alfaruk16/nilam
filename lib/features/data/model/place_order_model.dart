class PlaceOrderModel {
  final String orderType;
  final String shippedBy;
  final int shippingAddressId;
  final int billingAddressId;
  final String orderNote;
  final String paymentMode;

  PlaceOrderModel({
    required this.orderType,
    required this.shippedBy,
    required this.shippingAddressId,
    required this.billingAddressId,
    required this.orderNote,
    required this.paymentMode,
  });

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) =>
      PlaceOrderModel(
        orderType: json["OrderType"],
        shippedBy: json["ShippedBy"],
        shippingAddressId: json["ShippingAddressId"],
        billingAddressId: json["BillingAddressId"],
        orderNote: json["OrderNote"],
        paymentMode: json["PaymentMode"],
      );

  Map<String, dynamic> toJson() => {
        "OrderType": orderType,
        "ShippedBy": shippedBy,
        "ShippingAddressId": shippingAddressId,
        "BillingAddressId": billingAddressId,
        "OrderNote": orderNote,
        "PaymentMode": paymentMode,
      };
}

class BuyNowModel {
  final String orderType;
  final String shippedBy;
  final int shippingAddressId;
  final int billingAddressId;
  final String orderNote;
  final String paymentMode;
  final bool isAvailEmi;
  final int itemId;
  final int quantity;
  final double salesPrice;

  BuyNowModel({
    required this.orderType,
    required this.shippedBy,
    required this.shippingAddressId,
    required this.billingAddressId,
    required this.orderNote,
    required this.paymentMode,
    required this.isAvailEmi,
    required this.itemId,
    required this.quantity,
    required this.salesPrice,
  });

  factory BuyNowModel.fromJson(Map<String, dynamic> json) =>
      BuyNowModel(
        orderType: json["OrderType"],
        shippedBy: json["ShippedBy"],
        shippingAddressId: json["ShippingAddressId"],
        billingAddressId: json["BillingAddressId"],
        orderNote: json["OrderNote"],
        paymentMode: json["PaymentMode"],
        isAvailEmi: json["IsAvailEmi"],
        itemId: json["ItemId"],
        quantity: json["Quantity"],
        salesPrice: json["SalesPrice"],
      );

  Map<String, dynamic> toJson() => {
    "OrderType": orderType,
    "ShippedBy": shippedBy,
    "ShippingAddressId": shippingAddressId,
    "BillingAddressId": billingAddressId,
    "OrderNote": orderNote,
    "PaymentMode": paymentMode,
    "IsAvailEmi": isAvailEmi,
    "ItemId": itemId,
    "Quantity": quantity,
    "SalesPrice": salesPrice,
  };
}
