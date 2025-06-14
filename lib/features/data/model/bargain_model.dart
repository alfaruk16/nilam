class BargainModel {
  final int itemId;
  final String amount;
  final int quantity;
  final int bargainId;

  BargainModel({
    required this.itemId,
    required this.amount,
    required this.quantity,
    required this.bargainId,
  });

  factory BargainModel.fromJson(Map<String, dynamic> json) => BargainModel(
    itemId: json["ItemId"],
    amount: json["Amount"],
    quantity: json["Quantity"],
    bargainId: json["BargainId"],
  );

  Map<String, dynamic> toJson() => {
    "ItemId": itemId,
    "Amount": amount,
    "Quantity": quantity,
    "BargainId": bargainId,
  };
}