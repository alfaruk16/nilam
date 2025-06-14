class AddCartModel {
  final int? itemId;
  final int? quantity;
  final num? stock;
  final List<dynamic>? attributesInfo;

  AddCartModel({
    this.itemId,
    this.quantity,
    this.stock,
    this.attributesInfo,
  });

  factory AddCartModel.fromJson(Map<String, dynamic> json) => AddCartModel(
    itemId: json["ItemId"],
    quantity: json["Quantity"],
    stock: json["Stock"],
    attributesInfo: json["AttributesInfo"] == null ? [] : List<dynamic>.from(json["AttributesInfo"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ItemId": itemId,
    "Quantity": quantity,
    "Stock": stock,
    "AttributesInfo": attributesInfo == null ? [] : List<dynamic>.from(attributesInfo!.map((x) => x)),
  };
}
