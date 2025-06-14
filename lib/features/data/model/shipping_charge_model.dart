class ShippingChargeModel {
  final String cartType;
  final int addressId;
  final int itemId;
  final int quantity;

  ShippingChargeModel({
    required this.cartType,
    required this.addressId,
    required this.itemId,
    required this.quantity,
  });

  factory ShippingChargeModel.fromJson(Map<String, dynamic> json) =>
      ShippingChargeModel(
        cartType: json["CartType"],
        addressId: json["AddressId"],
        itemId: json["ItemId"],
        quantity: json["Quantity"],
      );

  Map<String, dynamic> toJson() => {
        "CartType": cartType,
        "AddressId": addressId,
        "ItemId": itemId,
        "Quantity": quantity,
      };
}
