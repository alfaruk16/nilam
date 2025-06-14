class BrandResponse {
  final int? id;
  final String? brandName;
  final dynamic description;
  final String? imageUrl;
  final String? iconUrl;
  final dynamic bannerUrl;
  final String? status;
  final int? imageId;
  final dynamic iconId;
  final dynamic bannerId;
  final int? sequence;
  final int? ownerId;
  final bool? isVerified;
  final bool? isFeatured;
  final int? itemCount;
  final dynamic link;
  final bool? isRestricted;
  final dynamic ownerName;
  final dynamic ownerDisplayId;

  BrandResponse({
    this.id,
    this.brandName,
    this.description,
    this.imageUrl,
    this.iconUrl,
    this.bannerUrl,
    this.status,
    this.imageId,
    this.iconId,
    this.bannerId,
    this.sequence,
    this.ownerId,
    this.isVerified,
    this.isFeatured,
    this.itemCount,
    this.link,
    this.isRestricted,
    this.ownerName,
    this.ownerDisplayId,
  });

  factory BrandResponse.fromJson(Map<String, dynamic> json) => BrandResponse(
    id: json["Id"],
    brandName: json["BrandName"],
    description: json["Description"],
    imageUrl: json["ImageUrl"],
    iconUrl: json["IconUrl"],
    bannerUrl: json["BannerUrl"],
    status: json["Status"],
    imageId: json["ImageId"],
    iconId: json["IconId"],
    bannerId: json["BannerId"],
    sequence: json["Sequence"],
    ownerId: json["OwnerId"],
    isVerified: json["IsVerified"],
    isFeatured: json["IsFeatured"],
    itemCount: json["ItemCount"],
    link: json["Link"],
    isRestricted: json["IsRestricted"],
    ownerName: json["OwnerName"],
    ownerDisplayId: json["OwnerDisplayId"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "BrandName": brandName,
    "Description": description,
    "ImageUrl": imageUrl,
    "IconUrl": iconUrl,
    "BannerUrl": bannerUrl,
    "Status": status,
    "ImageId": imageId,
    "IconId": iconId,
    "BannerId": bannerId,
    "Sequence": sequence,
    "OwnerId": ownerId,
    "IsVerified": isVerified,
    "IsFeatured": isFeatured,
    "ItemCount": itemCount,
    "Link": link,
    "IsRestricted": isRestricted,
    "OwnerName": ownerName,
    "OwnerDisplayId": ownerDisplayId,
  };
}
