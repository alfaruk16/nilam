class Product {
  final int? id;
  final int? userId;
  final int? categoryId;
  final String? categoryName;
  final String? condition;
  final int? itemId;
  final int? imageId;
  final String? imageRootUrl;
  final String? imageUrl;
  final String? imageName;
  final dynamic brandName;
  final String? itemName;
  final String? measurementName;
  final dynamic stockNature;
  final String? stockType;
  final String? saleType;
  final num? basePrice;
  final num? salesPrice;
  final num? discountedPrice;
  final num? stockQuantity;
  final num? cartQuantity;
  final String? shippedBy;
  final dynamic location;
  final bool? isVerified;
  final String? status;
  final bool? isFavorite;
  final bool? isPromoted;
  final dynamic auctionStatus;
  final dynamic startTime;
  final dynamic endTime;
  final num? averageRating;
  final int? noOfReview;
  final int? bidCount;
  final int? itemGroupId;
  final dynamic auctionId;
  final int? viewCount;
  final int? clickCount;
  final int? orderCount;
  final bool? hasAddToCart;
  final bool? hasBargain;
  final bool? hasBuyNow;
  final bool? isEmi;
  final dynamic orderId;
  final num? maxBidAmount;
  final dynamic bidAmount;
  final dynamic maxBidderId;
  final dynamic bidTime;
  final dynamic orderConfirmationLastTime;
  final dynamic orderConfirmAt;
  final dynamic winStatus;
  final dynamic createdAt;
  final String? createdAtFormated;
  final String? discountTag;
  final dynamic publishedAt;
  final String? publishedAtFormated;
  final String? slug;

  const Product({
    this.id,
    this.userId,
    this.categoryId,
    this.categoryName,
    this.condition,
    this.itemId,
    this.imageId,
    this.imageRootUrl,
    this.imageUrl,
    this.imageName,
    this.brandName,
    this.itemName,
    this.measurementName,
    this.stockNature,
    this.stockType,
    this.saleType,
    this.basePrice,
    this.salesPrice,
    this.discountedPrice,
    this.stockQuantity,
    this.cartQuantity,
    this.shippedBy,
    this.location,
    this.isVerified,
    this.status,
    this.isFavorite,
    this.isPromoted,
    this.auctionStatus,
    this.startTime,
    this.endTime,
    this.averageRating,
    this.noOfReview,
    this.bidCount,
    this.itemGroupId,
    this.auctionId,
    this.viewCount,
    this.clickCount,
    this.orderCount,
    this.hasAddToCart,
    this.hasBargain,
    this.hasBuyNow,
    this.isEmi,
    this.orderId,
    this.maxBidAmount,
    this.bidAmount,
    this.maxBidderId,
    this.bidTime,
    this.orderConfirmationLastTime,
    this.orderConfirmAt,
    this.winStatus,
    this.createdAt,
    this.createdAtFormated,
    this.discountTag,
    this.publishedAt,
    this.publishedAtFormated,
    this.slug,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      Product(
        id: json["Id"],
        userId: json["UserId"],
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        condition: json["Condition"],
        itemId: json["ItemId"],
        imageId: json["ImageId"],
        imageRootUrl: json["ImageRootUrl"],
        imageUrl: json["ImageUrl"],
        imageName: json["ImageName"],
        brandName: json["BrandName"],
        itemName: json["ItemName"],
        measurementName: json["MeasurementName"],
        stockNature: json["StockNature"],
        stockType: json["StockType"],
        saleType: json["SaleType"],
        basePrice: json["BasePrice"],
        salesPrice: json["SalesPrice"],
        discountedPrice: json["DiscountedPrice"],
        stockQuantity: json["StockQuantity"],
        cartQuantity: json["CartQuantity"],
        shippedBy: json["ShippedBy"],
        location: json["Location"],
        isVerified: json["IsVerified"],
        status: json["Status"],
        isFavorite: json["IsFavorite"],
        isPromoted: json["IsPromoted"],
        auctionStatus: json["AuctionStatus"],
        startTime: json["StartTime"],
        endTime: json["EndTime"],
        averageRating: json["AverageRating"],
        noOfReview: json["NoOfReview"],
        bidCount: json["BidCount"],
        itemGroupId: json["ItemGroupId"],
        auctionId: json["AuctionId"],
        viewCount: json["ViewCount"],
        clickCount: json["ClickCount"],
        orderCount: json["OrderCount"],
        hasAddToCart: json["HasAddToCart"],
        hasBargain: json["HasBargain"],
        hasBuyNow: json["HasBuyNow"],
        isEmi: json["IsEmi"],
        orderId: json["OrderId"],
        maxBidAmount: json["MaxBidAmount"],
        bidAmount: json["BidAmount"],
        maxBidderId: json["MaxBidderId"],
        bidTime: json["BidTime"],
        orderConfirmationLastTime: json["OrderConfirmationLastTime"],
        orderConfirmAt: json["OrderConfirmAt"],
        winStatus: json["WinStatus"],
        createdAt: json["CreatedAt"],
        createdAtFormated: json["CreatedAtFormated"],
        discountTag: json["DiscountTag"],
        publishedAt: json["PublishedAt"],
        publishedAtFormated: json["PublishedAtFormated"],
        slug: json["Slug"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "Condition":condition,
        "ItemId": itemId,
        "ImageId": imageId,
        "ImageRootUrl": imageRootUrl,
        "ImageUrl": imageUrl,
        "ImageName": imageName,
        "BrandName": brandName,
        "ItemName": itemName,
        "MeasurementName":measurementName,
        "StockNature": stockNature,
        "StockType": stockType,
        "SaleType":saleType,
        "BasePrice": basePrice,
        "SalesPrice": salesPrice,
        "DiscountedPrice": discountedPrice,
        "StockQuantity": stockQuantity,
        "CartQuantity": cartQuantity,
        "ShippedBy": shippedBy,
        "Location": location,
        "IsVerified": isVerified,
        "Status": status,
        "IsFavorite": isFavorite,
        "IsPromoted": isPromoted,
        "AuctionStatus": auctionStatus,
        "StartTime": startTime,
        "EndTime": endTime,
        "AverageRating": averageRating,
        "NoOfReview": noOfReview,
        "BidCount": bidCount,
        "ItemGroupId": itemGroupId,
        "AuctionId": auctionId,
        "ViewCount": viewCount,
        "ClickCount": clickCount,
        "OrderCount": orderCount,
        "HasAddToCart": hasAddToCart,
        "HasBargain": hasBargain,
        "HasBuyNow": hasBuyNow,
        "IsEmi": isEmi,
        "OrderId": orderId,
        "MaxBidAmount": maxBidAmount,
        "BidAmount": bidAmount,
        "MaxBidderId": maxBidderId,
        "BidTime": bidTime,
        "OrderConfirmationLastTime": orderConfirmationLastTime,
        "OrderConfirmAt": orderConfirmAt,
        "WinStatus": winStatus,
        "CreatedAt": createdAt,
        "CreatedAtFormated": createdAtFormated,
        "DiscountTag": discountTag,
        "PublishedAt": publishedAt,
        "PublishedAtFormated": publishedAtFormated,
        "Slug": slug,
      };
}
