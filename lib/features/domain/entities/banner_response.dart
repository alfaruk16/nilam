class BannerResponse {
  final int? id;
  final dynamic headTitle;
  final dynamic title;
  final dynamic summary;
  final num? actualPrice;
  final num? discountPrice;
  final int? imageId;
  final String? imageUrl;
  final int? mobileImageId;
  final String? mobileImageUrl;
  final dynamic buttonText;
  final String? type;
  final dynamic link;
  final dynamic colorCode;
  final dynamic backgroundColorCode;
  final int? sequence;
  final dynamic reference;
  final String? language;
  final String? status;

  BannerResponse({
    this.id,
    this.headTitle,
    this.title,
    this.summary,
    this.actualPrice,
    this.discountPrice,
    this.imageId,
    this.imageUrl,
    this.mobileImageId,
    this.mobileImageUrl,
    this.buttonText,
    this.type,
    this.link,
    this.colorCode,
    this.backgroundColorCode,
    this.sequence,
    this.reference,
    this.language,
    this.status,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
    id: json["Id"],
    headTitle: json["HeadTitle"],
    title: json["Title"],
    summary: json["Summary"],
    actualPrice: json["ActualPrice"],
    discountPrice: json["DiscountPrice"],
    imageId: json["ImageId"],
    imageUrl: json["ImageUrl"],
    mobileImageId: json["MobileImageId"],
    mobileImageUrl: json["MobileImageUrl"],
    buttonText: json["ButtonText"],
    type: json["Type"],
    link: json["Link"],
    colorCode: json["ColorCode"],
    backgroundColorCode: json["BackgroundColorCode"],
    sequence: json["Sequence"],
    reference: json["Reference"],
    language: json["Language"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "HeadTitle": headTitle,
    "Title": title,
    "Summary": summary,
    "ActualPrice": actualPrice,
    "DiscountPrice": discountPrice,
    "ImageId": imageId,
    "ImageUrl": imageUrl,
    "MobileImageId": mobileImageId,
    "MobileImageUrl": mobileImageUrl,
    "ButtonText": buttonText,
    "Type": type,
    "Link": link,
    "ColorCode": colorCode,
    "BackgroundColorCode": backgroundColorCode,
    "Sequence": sequence,
    "Reference": reference,
    "Language": language,
    "Status": status,
  };
}
