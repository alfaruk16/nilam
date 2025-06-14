class AutoBidModel {
  final bool isPercentage;
  final String maxAmount;
  final String increaseRate;
  final int auctionId;

  AutoBidModel({
    required this.isPercentage,
    required this.maxAmount,
    required this.increaseRate,
    required this.auctionId,
  });

  factory AutoBidModel.fromJson(Map<String, dynamic> json) => AutoBidModel(
        isPercentage: json["IsPercentage"],
        maxAmount: json["MaxAmount"],
        increaseRate: json["IncreaseRate"],
        auctionId: json["AuctionId"],
      );

  Map<String, dynamic> toJson() => {
        "IsPercentage": isPercentage,
        "MaxAmount": maxAmount,
        "IncreaseRate": increaseRate,
        "AuctionId": auctionId,
      };
}
