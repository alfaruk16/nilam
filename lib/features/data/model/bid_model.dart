class BidModel {
  final int auctionId;
  final String bidAmount;

  BidModel({
    required this.auctionId,
    required this.bidAmount,
  });

  factory BidModel.fromJson(Map<String, dynamic> json) => BidModel(
    auctionId: json["AuctionId"],
    bidAmount: json["BidAmount"],
  );

  Map<String, dynamic> toJson() => {
    "AuctionId": auctionId,
    "BidAmount": bidAmount,
  };
}
