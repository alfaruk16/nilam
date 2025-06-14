class BidInfoResponse {
  final int? id;
  final int? auctionId;
  final int? itemId;
  final int? userId;
  final String? userName;
  final num? bidAmount;
  final bool? isShortlisted;
  final bool? isOutBid;
  final bool? isAutoBid;
  final DateTime? createdAt;
  final String? createdAtFormated;

  const BidInfoResponse({
    this.id,
    this.auctionId,
    this.itemId,
    this.userId,
    this.userName,
    this.bidAmount,
    this.isShortlisted,
    this.isOutBid,
    this.isAutoBid,
    this.createdAt,
    this.createdAtFormated,
  });

  factory BidInfoResponse.fromJson(Map<String, dynamic> json) =>
      BidInfoResponse(
        id: json["Id"],
        auctionId: json["AuctionId"],
        itemId: json["ItemId"],
        userId: json["UserId"],
        userName: json["UserName"],
        bidAmount: json["BidAmount"],
        isShortlisted: json["IsShortlisted"],
        isOutBid: json["IsOutBid"],
        isAutoBid: json["IsAutoBid"],
        createdAt: json["CreatedAt"] == null
            ? null
            : DateTime.parse(json["CreatedAt"]),
        createdAtFormated: json["CreatedAtFormated"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "AuctionId": auctionId,
        "ItemId": itemId,
        "UserId": userId,
        "UserName": userName,
        "BidAmount": bidAmount,
        "IsShortlisted": isShortlisted,
        "IsOutBid": isOutBid,
        "IsAutoBid": isAutoBid,
        "CreatedAt": createdAt?.toIso8601String(),
        "CreatedAtFormated": createdAtFormated,
      };
}
