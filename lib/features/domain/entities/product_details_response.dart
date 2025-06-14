class ProductDetails {
  final int? id;
  final int? userId;
  final int? categoryId;
  final String? categoryName;
  final String? condition;
  final dynamic brandName;
  final String? displayId;
  final String? itemName;
  final String? measurementName;
  final dynamic stockNature;
  final String? stockType;
  final String? saleType;
  final num? salesPrice;
  final num? basePrice;
  final num? discountedPrice;
  final num? stockQuantity;
  final num? cartQuantity;
  final num? currentBid;
  final num? bidderCount;
  final num? bidCount;
  final num? maxBidderId;
  final dynamic orderId;
  final num? viewCount;
  final num? clickCount;
  final num? orderCount;
  final String? metaTitle;
  final String? metaKeyword;
  final String? metaDescription;
  final num? approximatePrice;
  final num? buyNowPrice;
  final num? userLastBid;
  final DateTime? startTime;
  final String? endTime;
  final dynamic orderConfirmationLastTime;
  final String? auctionStatus;
  final String? summary;
  final String? description;
  final bool? hasWarranty;
  final dynamic warrantyNote;
  final bool? isVerified;
  final String? status;
  final bool? isFavorite;
  final bool? isPromoted;
  final bool? isEmi;
  final String? shippedBy;
  final dynamic location;
  final num? averageRating;
  final num? noOfReview;
  final DateTime? publishedAt;
  final int? auctionId;
  final num? itemGroupId;
  final num? sellerId;
  final String? sellerName;
  final num? sellerPositiveRating;
  final num? sellerResponseRating;
  final List<Document>? documents;
  final List<Attribute>? attributes;
  final List<dynamic>? itemCombinations;
  final bool? hasAddToCart;
  final bool? hasBargain;
  final bool? hasBuyNow;
  final String? companyName;
  final List<BradcrumbCategory>? bradcrumbCategories;
  final dynamic automaticBid;
  final dynamic parentIds;
  final String? slug;
  final String? discountTag;

  const ProductDetails({
    this.id,
    this.userId,
    this.categoryId,
    this.categoryName,
    this.condition,
    this.brandName,
    this.displayId,
    this.itemName,
    this.measurementName,
    this.stockNature,
    this.stockType,
    this.saleType,
    this.salesPrice,
    this.basePrice,
    this.discountedPrice,
    this.stockQuantity,
    this.cartQuantity,
    this.currentBid,
    this.bidderCount,
    this.bidCount,
    this.maxBidderId,
    this.orderId,
    this.viewCount,
    this.clickCount,
    this.orderCount,
    this.metaTitle,
    this.metaKeyword,
    this.metaDescription,
    this.approximatePrice,
    this.buyNowPrice,
    this.userLastBid,
    this.startTime,
    this.endTime,
    this.orderConfirmationLastTime,
    this.auctionStatus,
    this.summary,
    this.description,
    this.hasWarranty,
    this.warrantyNote,
    this.isVerified,
    this.status,
    this.isFavorite,
    this.isPromoted,
    this.isEmi,
    this.shippedBy,
    this.location,
    this.averageRating,
    this.noOfReview,
    this.publishedAt,
    this.auctionId,
    this.itemGroupId,
    this.sellerId,
    this.sellerName,
    this.sellerPositiveRating,
    this.sellerResponseRating,
    this.documents,
    this.attributes,
    this.itemCombinations,
    this.hasAddToCart,
    this.hasBargain,
    this.hasBuyNow,
    this.companyName,
    this.bradcrumbCategories,
    this.automaticBid,
    this.parentIds,
    this.slug,
    this.discountTag,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["Id"],
        userId: json["UserId"],
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        condition: json["Condition"],
        brandName: json["BrandName"],
        displayId: json["DisplayId"],
        itemName: json["ItemName"],
        measurementName: json["MeasurementName"],
        stockNature: json["StockNature"],
        stockType: json["StockType"],
        saleType: json["SaleType"],
        salesPrice: json["SalesPrice"],
        basePrice: json["BasePrice"],
        discountedPrice: json["DiscountedPrice"],
        stockQuantity: json["StockQuantity"],
        cartQuantity: json["CartQuantity"],
        currentBid: json["CurrentBid"],
        bidderCount: json["BidderCount"],
        bidCount: json["BidCount"],
        maxBidderId: json["MaxBidderId"],
        orderId: json["OrderId"],
        viewCount: json["ViewCount"],
        clickCount: json["ClickCount"],
        orderCount: json["OrderCount"],
        metaTitle: json["MetaTitle"],
        metaKeyword: json["MetaKeyword"],
        metaDescription: json["MetaDescription"],
        approximatePrice: json["ApproximatePrice"],
        buyNowPrice: json["BuyNowPrice"],
        userLastBid: json["UserLastBid"],
        startTime: json["StartTime"] == null
            ? null
            : DateTime.parse(json["StartTime"]),
        endTime: json["EndTime"],
        orderConfirmationLastTime: json["OrderConfirmationLastTime"],
        auctionStatus: json["AuctionStatus"],
        summary: json["Summary"],
        description: json["Description"],
        hasWarranty: json["HasWarranty"],
        warrantyNote: json["WarrantyNote"],
        isVerified: json["IsVerified"],
        status: json["Status"],
        isFavorite: json["IsFavorite"],
        isPromoted: json["IsPromoted"],
        isEmi: json["IsEmi"],
        shippedBy: json["ShippedBy"],
        location: json["Location"],
        averageRating: json["AverageRating"],
        noOfReview: json["NoOfReview"],
        publishedAt: json["PublishedAt"] == null
            ? null
            : DateTime.parse(json["PublishedAt"]),
        auctionId: json["AuctionId"],
        itemGroupId: json["ItemGroupId"],
        sellerId: json["SellerId"],
        sellerName: json["SellerName"],
        sellerPositiveRating: json["SellerPositiveRating"],
        sellerResponseRating: json["SellerResponseRating"],
        documents: json["Documents"] == null
            ? []
            : List<Document>.from(
                json["Documents"]!.map((x) => Document.fromJson(x))),
        attributes: json["Attributes"] == null
            ? []
            : List<Attribute>.from(
                json["Attributes"]!.map((x) => Attribute.fromJson(x))),
        itemCombinations: json["ItemCombinations"] == null
            ? []
            : List<dynamic>.from(json["ItemCombinations"]!.map((x) => x)),
        hasAddToCart: json["HasAddToCart"],
        hasBargain: json["HasBargain"],
        hasBuyNow: json["HasBuyNow"],
        companyName: json["CompanyName"],
        bradcrumbCategories: json["BradcrumbCategories"] == null
            ? []
            : List<BradcrumbCategory>.from(json["BradcrumbCategories"]!
                .map((x) => BradcrumbCategory.fromJson(x))),
        automaticBid: json["AutomaticBid"],
        parentIds: json["ParentIds"],
        slug: json["Slug"],
        discountTag: json["DiscountTag"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "Condition": condition,
        "BrandName": brandName,
        "DisplayId": displayId,
        "ItemName": itemName,
        "MeasurementName": measurementName,
        "StockNature": stockNature,
        "StockType": stockType,
        "SaleType": saleType,
        "SalesPrice": salesPrice,
        "BasePrice": basePrice,
        "DiscountedPrice": discountedPrice,
        "StockQuantity": stockQuantity,
        "CartQuantity": cartQuantity,
        "CurrentBid": currentBid,
        "BidderCount": bidderCount,
        "BidCount": bidCount,
        "MaxBidderId": maxBidderId,
        "OrderId": orderId,
        "ViewCount": viewCount,
        "ClickCount": clickCount,
        "OrderCount": orderCount,
        "MetaTitle": metaTitle,
        "MetaKeyword": metaKeyword,
        "MetaDescription": metaDescription,
        "ApproximatePrice": approximatePrice,
        "BuyNowPrice": buyNowPrice,
        "UserLastBid": userLastBid,
        "StartTime": startTime?.toIso8601String(),
        "EndTime": endTime,
        "OrderConfirmationLastTime": orderConfirmationLastTime,
        "AuctionStatus": auctionStatus,
        "Summary": summary,
        "Description": description,
        "HasWarranty": hasWarranty,
        "WarrantyNote": warrantyNote,
        "IsVerified": isVerified,
        "Status": status,
        "IsFavorite": isFavorite,
        "IsPromoted": isPromoted,
        "IsEmi": isEmi,
        "ShippedBy": shippedBy,
        "Location": location,
        "AverageRating": averageRating,
        "NoOfReview": noOfReview,
        "PublishedAt": publishedAt?.toIso8601String(),
        "AuctionId": auctionId,
        "ItemGroupId": itemGroupId,
        "SellerId": sellerId,
        "SellerName": sellerName,
        "SellerPositiveRating": sellerPositiveRating,
        "SellerResponseRating": sellerResponseRating,
        "Documents": documents == null
            ? []
            : List<dynamic>.from(documents!.map((x) => x.toJson())),
        "Attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "ItemCombinations": itemCombinations == null
            ? []
            : List<dynamic>.from(itemCombinations!.map((x) => x)),
        "HasAddToCart": hasAddToCart,
        "HasBargain": hasBargain,
        "HasBuyNow": hasBuyNow,
        "CompanyName": companyName,
        "BradcrumbCategories": bradcrumbCategories == null
            ? []
            : List<dynamic>.from(bradcrumbCategories!.map((x) => x.toJson())),
        "AutomaticBid": automaticBid,
        "ParentIds": parentIds,
        "Slug": slug,
        "DiscountTag": discountTag,
      };
}

class Attribute {
  final int? id;
  final int? categoryId;
  final String? categoryName;
  final String? name;
  final bool? isMapped;
  final bool? isMultiple;

  Attribute({
    this.id,
    this.categoryId,
    this.categoryName,
    this.name,
    this.isMapped,
    this.isMultiple,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["Id"],
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        name: json["Name"],
        isMapped: json["IsMapped"],
        isMultiple: json["IsMultiple"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "Name": name,
        "IsMapped": isMapped,
        "IsMultiple": isMultiple,
      };
}

class BradcrumbCategory {
  final int? id;
  final String? categoryName;

  BradcrumbCategory({
    this.id,
    this.categoryName,
  });

  factory BradcrumbCategory.fromJson(Map<String, dynamic> json) =>
      BradcrumbCategory(
        id: json["Id"],
        categoryName: json["CategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CategoryName": categoryName,
      };
}

class Document {
  final int? id;
  final int? userId;
  final String? title;
  final String? uuid;
  final String? localPath;
  final String? filePath;
  final dynamic mimeType;
  final int? size;
  final String? referenceType;
  final int? referenceId;
  final bool? isCover;
  final int? sequence;
  final bool? isApproved;
  final List<OtherPath>? otherPath;

  Document({
    this.id,
    this.userId,
    this.title,
    this.uuid,
    this.localPath,
    this.filePath,
    this.mimeType,
    this.size,
    this.referenceType,
    this.referenceId,
    this.isCover,
    this.sequence,
    this.isApproved,
    this.otherPath,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["Id"],
        userId: json["UserId"],
        title: json["Title"],
        uuid: json["UUID"],
        localPath: json["LocalPath"],
        filePath: json["FilePath"],
        mimeType: json["MimeType"],
        size: json["Size"],
        referenceType: json["ReferenceType"],
        referenceId: json["ReferenceId"],
        isCover: json["IsCover"],
        sequence: json["Sequence"],
        isApproved: json["IsApproved"],
        otherPath: json["OtherPath"] == null
            ? []
            : List<OtherPath>.from(
                json["OtherPath"]!.map((x) => OtherPath.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserId": userId,
        "Title": title,
        "UUID": uuid,
        "LocalPath": localPath,
        "FilePath": filePath,
        "MimeType": mimeType,
        "Size": size,
        "ReferenceType": referenceType,
        "ReferenceId": referenceId,
        "IsCover": isCover,
        "Sequence": sequence,
        "IsApproved": isApproved,
        "OtherPath": otherPath == null
            ? []
            : List<dynamic>.from(otherPath!.map((x) => x.toJson())),
      };
}

class OtherPath {
  final String? fileGroup;
  final String? filePath;

  OtherPath({
    this.fileGroup,
    this.filePath,
  });

  factory OtherPath.fromJson(Map<String, dynamic> json) => OtherPath(
        fileGroup: json["FileGroup"],
        filePath: json["FilePath"],
      );

  Map<String, dynamic> toJson() => {
        "FileGroup": fileGroup,
        "FilePath": filePath,
      };
}
