class CategoryResponse {
  final int? id;
  final String? name;
  final String? nameBn;
  final String? description;
  final dynamic parentId;
  final int? depth;
  final bool? isSaleable;
  final bool? isFeatured;
  final int? sequence;
  final num? minAmount;
  final num? maxAmount;
  final bool? isNegativeStockAllowed;
  final bool? isPrePaymentRequired;
  final String? imageUrl;
  final String? iconUrl;
  final String? headerIconUrl;
  final int? headerIconId;
  final dynamic badge;
  final dynamic attributeCategoryIds;
  final num? sellerServiceCharge;
  final bool? showOnHeader;
  final bool? isOpenDeliveryCharge;
  final num? baseWeight;
  final num? deliveryChargeInside;
  final num? deliveryChargeAddOnInside;
  final num? deliveryChargeOutside;
  final num? deliveryChargeAddOnOutside;
  final dynamic metaKeywords;
  final String? metaKeyword;
  final String? metaDescription;
  final Status? status;
  final int? imageId;
  final int? iconId;
  final List<dynamic>? parents;
  final dynamic parent;
  final bool? isCostOverwrite;
  final List<dynamic>? children;

  CategoryResponse({
    this.id,
    this.name,
    this.nameBn,
    this.description,
    this.parentId,
    this.depth,
    this.isSaleable,
    this.isFeatured,
    this.sequence,
    this.minAmount,
    this.maxAmount,
    this.isNegativeStockAllowed,
    this.isPrePaymentRequired,
    this.imageUrl,
    this.iconUrl,
    this.headerIconUrl,
    this.headerIconId,
    this.badge,
    this.attributeCategoryIds,
    this.sellerServiceCharge,
    this.showOnHeader,
    this.isOpenDeliveryCharge,
    this.baseWeight,
    this.deliveryChargeInside,
    this.deliveryChargeAddOnInside,
    this.deliveryChargeOutside,
    this.deliveryChargeAddOnOutside,
    this.metaKeywords,
    this.metaKeyword,
    this.metaDescription,
    this.status,
    this.imageId,
    this.iconId,
    this.parents,
    this.parent,
    this.isCostOverwrite,
    this.children,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    id: json["Id"],
    name: json["Name"],
    nameBn: json["NameBN"],
    description: json["Description"],
    parentId: json["ParentId"],
    depth: json["Depth"],
    isSaleable: json["IsSaleable"],
    isFeatured: json["IsFeatured"],
    sequence: json["Sequence"],
    minAmount: json["MinAmount"],
    maxAmount: json["MaxAmount"],
    isNegativeStockAllowed: json["IsNegativeStockAllowed"],
    isPrePaymentRequired: json["IsPrePaymentRequired"],
    imageUrl: json["ImageUrl"],
    iconUrl: json["IconUrl"],
    headerIconUrl: json["HeaderIconUrl"],
    headerIconId: json["HeaderIconId"],
    badge: json["Badge"],
    attributeCategoryIds: json["AttributeCategoryIds"],
    sellerServiceCharge: json["SellerServiceCharge"],
    showOnHeader: json["ShowOnHeader"],
    isOpenDeliveryCharge: json["IsOpenDeliveryCharge"],
    baseWeight: json["BaseWeight"],
    deliveryChargeInside: json["DeliveryChargeInside"],
    deliveryChargeAddOnInside: json["DeliveryChargeAddOnInside"],
    deliveryChargeOutside: json["DeliveryChargeOutside"],
    deliveryChargeAddOnOutside: json["DeliveryChargeAddOnOutside"],
    metaKeywords: json["MetaKeywords"],
    metaKeyword: json["MetaKeyword"],
    metaDescription: json["MetaDescription"],
    status: statusValues.map[json["Status"]]!,
    imageId: json["ImageId"],
    iconId: json["IconId"],
    parents: json["Parents"] == null ? [] : List<dynamic>.from(json["Parents"]!.map((x) => x)),
    parent: json["Parent"],
    isCostOverwrite: json["IsCostOverwrite"],
    children: json["Children"] == null ? [] : List<dynamic>.from(json["Children"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "NameBN": nameBn,
    "Description": description,
    "ParentId": parentId,
    "Depth": depth,
    "IsSaleable": isSaleable,
    "IsFeatured": isFeatured,
    "Sequence": sequence,
    "MinAmount": minAmount,
    "MaxAmount": maxAmount,
    "IsNegativeStockAllowed": isNegativeStockAllowed,
    "IsPrePaymentRequired": isPrePaymentRequired,
    "ImageUrl": imageUrl,
    "IconUrl": iconUrl,
    "HeaderIconUrl": headerIconUrl,
    "HeaderIconId": headerIconId,
    "Badge": badge,
    "AttributeCategoryIds": attributeCategoryIds,
    "SellerServiceCharge": sellerServiceCharge,
    "ShowOnHeader": showOnHeader,
    "IsOpenDeliveryCharge": isOpenDeliveryCharge,
    "BaseWeight": baseWeight,
    "DeliveryChargeInside": deliveryChargeInside,
    "DeliveryChargeAddOnInside": deliveryChargeAddOnInside,
    "DeliveryChargeOutside": deliveryChargeOutside,
    "DeliveryChargeAddOnOutside": deliveryChargeAddOnOutside,
    "MetaKeywords": metaKeywords,
    "MetaKeyword": metaKeyword,
    "MetaDescription": metaDescription,
    "Status": statusValues.reverse[status],
    "ImageId": imageId,
    "IconId": iconId,
    "Parents": parents == null ? [] : List<dynamic>.from(parents!.map((x) => x)),
    "Parent": parent,
    "IsCostOverwrite": isCostOverwrite,
    "Children": children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
  };
}

enum Status {
  ACTIVE
}

final statusValues = EnumValues({
  "Active": Status.ACTIVE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
