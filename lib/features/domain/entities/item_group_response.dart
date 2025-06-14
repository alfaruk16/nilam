class ItemGroupResponse {
  final int? id;
  final String? siteTitle;
  final dynamic siteSlogan;
  final String? siteSummary;
  final dynamic siteNotice;
  final String? siteUrl;
  final String? apiUrl;
  final String? documentBaseUrl;
  final String? logoPath;
  final String? mobileLogoPath;
  final String? socialLogoPath;
  final String? faviconPath;
  final String? invoiceLogoPath;
  final Address? address;
  final SocialAddress? socialAddress;
  final String? email;
  final String? mobile;
  final dynamic hotLine;
  final dynamic siteCopyRight;
  final dynamic androidAppUrl;
  final dynamic iosAppUrl;
  final dynamic metaTitle;
  final String? metaKeywords;
  final String? metaDescription;
  final String? metaAuthor;
  final String? currencyIcon;
  final String? currency;
  final dynamic language;
  final int? deliveryCharge;
  final int? deliveryChargeFreeAmount;
  final String? googleAnalyticsId;
  final String? facebookAppId;
  final int? deliveryFrom;
  final int? deliveryTo;
  final bool? isDefault;
  final bool? isNotificationEnable;
  final String? termsAndConditionUrl;
  final String? privacyPolicyUrl;
  final bool? isECommerce;
  final bool? isUsePoint;
  final int? tenantId;
  final List<MediaConfiguration>? mediaConfiguration;
  final ApplicationPolicy? applicationPolicy;
  final List<FooterMenu>? footerMenus;
  final List<dynamic>? bankDetails;

  ItemGroupResponse({
    this.id,
    this.siteTitle,
    this.siteSlogan,
    this.siteSummary,
    this.siteNotice,
    this.siteUrl,
    this.apiUrl,
    this.documentBaseUrl,
    this.logoPath,
    this.mobileLogoPath,
    this.socialLogoPath,
    this.faviconPath,
    this.invoiceLogoPath,
    this.address,
    this.socialAddress,
    this.email,
    this.mobile,
    this.hotLine,
    this.siteCopyRight,
    this.androidAppUrl,
    this.iosAppUrl,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.metaAuthor,
    this.currencyIcon,
    this.currency,
    this.language,
    this.deliveryCharge,
    this.deliveryChargeFreeAmount,
    this.googleAnalyticsId,
    this.facebookAppId,
    this.deliveryFrom,
    this.deliveryTo,
    this.isDefault,
    this.isNotificationEnable,
    this.termsAndConditionUrl,
    this.privacyPolicyUrl,
    this.isECommerce,
    this.isUsePoint,
    this.tenantId,
    this.mediaConfiguration,
    this.applicationPolicy,
    this.footerMenus,
    this.bankDetails,
  });

  factory ItemGroupResponse.fromJson(Map<String, dynamic> json) => ItemGroupResponse(
    id: json["Id"],
    siteTitle: json["SiteTitle"],
    siteSlogan: json["SiteSlogan"],
    siteSummary: json["SiteSummary"],
    siteNotice: json["SiteNotice"],
    siteUrl: json["SiteUrl"],
    apiUrl: json["APIUrl"],
    documentBaseUrl: json["DocumentBaseUrl"],
    logoPath: json["LogoPath"],
    mobileLogoPath: json["MobileLogoPath"],
    socialLogoPath: json["SocialLogoPath"],
    faviconPath: json["FaviconPath"],
    invoiceLogoPath: json["InvoiceLogoPath"],
    address: json["Address"] == null ? null : Address.fromJson(json["Address"]),
    socialAddress: json["SocialAddress"] == null ? null : SocialAddress.fromJson(json["SocialAddress"]),
    email: json["Email"],
    mobile: json["Mobile"],
    hotLine: json["HotLine"],
    siteCopyRight: json["SiteCopyRight"],
    androidAppUrl: json["AndroidAppUrl"],
    iosAppUrl: json["IOSAppUrl"],
    metaTitle: json["MetaTitle"],
    metaKeywords: json["MetaKeywords"],
    metaDescription: json["MetaDescription"],
    metaAuthor: json["MetaAuthor"],
    currencyIcon: json["CurrencyIcon"],
    currency: json["Currency"],
    language: json["Language"],
    deliveryCharge: json["DeliveryCharge"],
    deliveryChargeFreeAmount: json["DeliveryChargeFreeAmount"],
    googleAnalyticsId: json["GoogleAnalyticsId"],
    facebookAppId: json["FacebookAppId"],
    deliveryFrom: json["DeliveryFrom"],
    deliveryTo: json["DeliveryTo"],
    isDefault: json["IsDefault"],
    isNotificationEnable: json["IsNotificationEnable"],
    termsAndConditionUrl: json["TermsAndConditionURL"],
    privacyPolicyUrl: json["PrivacyPolicyURL"],
    isECommerce: json["IsECommerce"],
    isUsePoint: json["IsUsePoint"],
    tenantId: json["TenantId"],
    mediaConfiguration: json["MediaConfiguration"] == null ? [] : List<MediaConfiguration>.from(json["MediaConfiguration"]!.map((x) => MediaConfiguration.fromJson(x))),
    applicationPolicy: json["ApplicationPolicy"] == null ? null : ApplicationPolicy.fromJson(json["ApplicationPolicy"]),
    footerMenus: json["FooterMenus"] == null ? [] : List<FooterMenu>.from(json["FooterMenus"]!.map((x) => FooterMenu.fromJson(x))),
    bankDetails: json["BankDetails"] == null ? [] : List<dynamic>.from(json["BankDetails"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "SiteTitle": siteTitle,
    "SiteSlogan": siteSlogan,
    "SiteSummary": siteSummary,
    "SiteNotice": siteNotice,
    "SiteUrl": siteUrl,
    "APIUrl": apiUrl,
    "DocumentBaseUrl": documentBaseUrl,
    "LogoPath": logoPath,
    "MobileLogoPath": mobileLogoPath,
    "SocialLogoPath": socialLogoPath,
    "FaviconPath": faviconPath,
    "InvoiceLogoPath": invoiceLogoPath,
    "Address": address?.toJson(),
    "SocialAddress": socialAddress?.toJson(),
    "Email": email,
    "Mobile": mobile,
    "HotLine": hotLine,
    "SiteCopyRight": siteCopyRight,
    "AndroidAppUrl": androidAppUrl,
    "IOSAppUrl": iosAppUrl,
    "MetaTitle": metaTitle,
    "MetaKeywords": metaKeywords,
    "MetaDescription": metaDescription,
    "MetaAuthor": metaAuthor,
    "CurrencyIcon": currencyIcon,
    "Currency": currency,
    "Language": language,
    "DeliveryCharge": deliveryCharge,
    "DeliveryChargeFreeAmount": deliveryChargeFreeAmount,
    "GoogleAnalyticsId": googleAnalyticsId,
    "FacebookAppId": facebookAppId,
    "DeliveryFrom": deliveryFrom,
    "DeliveryTo": deliveryTo,
    "IsDefault": isDefault,
    "IsNotificationEnable": isNotificationEnable,
    "TermsAndConditionURL": termsAndConditionUrl,
    "PrivacyPolicyURL": privacyPolicyUrl,
    "IsECommerce": isECommerce,
    "IsUsePoint": isUsePoint,
    "TenantId": tenantId,
    "MediaConfiguration": mediaConfiguration == null ? [] : List<dynamic>.from(mediaConfiguration!.map((x) => x.toJson())),
    "ApplicationPolicy": applicationPolicy?.toJson(),
    "FooterMenus": footerMenus == null ? [] : List<dynamic>.from(footerMenus!.map((x) => x.toJson())),
    "BankDetails": bankDetails == null ? [] : List<dynamic>.from(bankDetails!.map((x) => x)),
  };
}

class Address {
  final int? id;
  final dynamic title;
  final dynamic name;
  final dynamic type;
  final dynamic email;
  final dynamic mobile;
  final dynamic countryCode;
  final dynamic divisionId;
  final dynamic districtId;
  final dynamic thanaId;
  final dynamic unionId;
  final String? address1;
  final dynamic address2;
  final dynamic placeId;
  final dynamic latitude;
  final dynamic longitude;
  final bool? isDefault;
  final bool? isPickupPoint;
  final dynamic divisionName;
  final dynamic districtName;
  final dynamic thanaName;
  final dynamic unionName;
  final dynamic districtInfo;
  final dynamic divisionInfo;

  Address({
    this.id,
    this.title,
    this.name,
    this.type,
    this.email,
    this.mobile,
    this.countryCode,
    this.divisionId,
    this.districtId,
    this.thanaId,
    this.unionId,
    this.address1,
    this.address2,
    this.placeId,
    this.latitude,
    this.longitude,
    this.isDefault,
    this.isPickupPoint,
    this.divisionName,
    this.districtName,
    this.thanaName,
    this.unionName,
    this.districtInfo,
    this.divisionInfo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["Id"],
    title: json["Title"],
    name: json["Name"],
    type: json["Type"],
    email: json["Email"],
    mobile: json["Mobile"],
    countryCode: json["CountryCode"],
    divisionId: json["DivisionId"],
    districtId: json["DistrictId"],
    thanaId: json["ThanaId"],
    unionId: json["UnionId"],
    address1: json["Address1"],
    address2: json["Address2"],
    placeId: json["PlaceId"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    isDefault: json["IsDefault"],
    isPickupPoint: json["IsPickupPoint"],
    divisionName: json["DivisionName"],
    districtName: json["DistrictName"],
    thanaName: json["ThanaName"],
    unionName: json["UnionName"],
    districtInfo: json["DistrictInfo"],
    divisionInfo: json["DivisionInfo"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "Name": name,
    "Type": type,
    "Email": email,
    "Mobile": mobile,
    "CountryCode": countryCode,
    "DivisionId": divisionId,
    "DistrictId": districtId,
    "ThanaId": thanaId,
    "UnionId": unionId,
    "Address1": address1,
    "Address2": address2,
    "PlaceId": placeId,
    "Latitude": latitude,
    "Longitude": longitude,
    "IsDefault": isDefault,
    "IsPickupPoint": isPickupPoint,
    "DivisionName": divisionName,
    "DistrictName": districtName,
    "ThanaName": thanaName,
    "UnionName": unionName,
    "DistrictInfo": districtInfo,
    "DivisionInfo": divisionInfo,
  };
}

class ApplicationPolicy {
  final int? id;
  final int? minimumPasswordLength;
  final int? userPointOnRegistration;
  final int? requiredPointOnPostProduct;
  final int? requiredPointOnPlaceBidding;
  final double? conversionRate;
  final dynamic serviceChargeId;
  final bool? isDefault;
  final bool? hasServiceCharge;
  final bool? hasAddToCart;
  final bool? hasBargain;
  final int? bargainFactor;
  final bool? hasBuyNow;
  final bool? hasPostItem;
  final bool? hasLanguage;

  ApplicationPolicy({
    this.id,
    this.minimumPasswordLength,
    this.userPointOnRegistration,
    this.requiredPointOnPostProduct,
    this.requiredPointOnPlaceBidding,
    this.conversionRate,
    this.serviceChargeId,
    this.isDefault,
    this.hasServiceCharge,
    this.hasAddToCart,
    this.hasBargain,
    this.bargainFactor,
    this.hasBuyNow,
    this.hasPostItem,
    this.hasLanguage,
  });

  factory ApplicationPolicy.fromJson(Map<String, dynamic> json) => ApplicationPolicy(
    id: json["Id"],
    minimumPasswordLength: json["MinimumPasswordLength"],
    userPointOnRegistration: json["UserPointOnRegistration"],
    requiredPointOnPostProduct: json["RequiredPointOnPostProduct"],
    requiredPointOnPlaceBidding: json["RequiredPointOnPlaceBidding"],
    conversionRate: json["ConversionRate"]?.toDouble(),
    serviceChargeId: json["ServiceChargeId"],
    isDefault: json["IsDefault"],
    hasServiceCharge: json["HasServiceCharge"],
    hasAddToCart: json["HasAddToCart"],
    hasBargain: json["HasBargain"],
    bargainFactor: json["BargainFactor"],
    hasBuyNow: json["HasBuyNow"],
    hasPostItem: json["HasPostItem"],
    hasLanguage: json["HasLanguage"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "MinimumPasswordLength": minimumPasswordLength,
    "UserPointOnRegistration": userPointOnRegistration,
    "RequiredPointOnPostProduct": requiredPointOnPostProduct,
    "RequiredPointOnPlaceBidding": requiredPointOnPlaceBidding,
    "ConversionRate": conversionRate,
    "ServiceChargeId": serviceChargeId,
    "IsDefault": isDefault,
    "HasServiceCharge": hasServiceCharge,
    "HasAddToCart": hasAddToCart,
    "HasBargain": hasBargain,
    "BargainFactor": bargainFactor,
    "HasBuyNow": hasBuyNow,
    "HasPostItem": hasPostItem,
    "HasLanguage": hasLanguage,
  };
}

class FooterMenu {
  final int? id;
  final String? pageTitle;
  final dynamic pageContent;
  final dynamic pageBannerUrl;
  final dynamic imageId;
  final String? link;
  final String? slug;
  final int? categoryId;
  final int? placement;
  final int? categorySequence;
  final int? sequence;
  final PageType? pageType;
  final dynamic param;
  final bool? isSystemRequired;
  final dynamic status;
  final CategoryName? categoryName;

  FooterMenu({
    this.id,
    this.pageTitle,
    this.pageContent,
    this.pageBannerUrl,
    this.imageId,
    this.link,
    this.slug,
    this.categoryId,
    this.placement,
    this.categorySequence,
    this.sequence,
    this.pageType,
    this.param,
    this.isSystemRequired,
    this.status,
    this.categoryName,
  });

  factory FooterMenu.fromJson(Map<String, dynamic> json) => FooterMenu(
    id: json["Id"],
    pageTitle: json["PageTitle"],
    pageContent: json["PageContent"],
    pageBannerUrl: json["PageBannerUrl"],
    imageId: json["ImageId"],
    link: json["Link"],
    slug: json["Slug"],
    categoryId: json["CategoryId"],
    placement: json["Placement"],
    categorySequence: json["CategorySequence"],
    sequence: json["Sequence"],
    pageType: pageTypeValues.map[json["PageType"]]!,
    param: json["Param"],
    isSystemRequired: json["IsSystemRequired"],
    status: json["Status"],
    categoryName: categoryNameValues.map[json["CategoryName"]]!,
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "PageTitle": pageTitle,
    "PageContent": pageContent,
    "PageBannerUrl": pageBannerUrl,
    "ImageId": imageId,
    "Link": link,
    "Slug": slug,
    "CategoryId": categoryId,
    "Placement": placement,
    "CategorySequence": categorySequence,
    "Sequence": sequence,
    "PageType": pageTypeValues.reverse[pageType],
    "Param": param,
    "IsSystemRequired": isSystemRequired,
    "Status": status,
    "CategoryName": categoryNameValues.reverse[categoryName],
  };
}

enum CategoryName { howItWorks, categories, myAccount, information }

final categoryNameValues = EnumValues({
  "Categories": CategoryName.categories,
  "How its works": CategoryName.howItWorks,
  "Information": CategoryName.information,
  "My Account": CategoryName.myAccount
});

enum PageType { webPage, thirdParty, functional }

final pageTypeValues = EnumValues({
  "Functional": PageType.functional,
  "ThirdParty": PageType.thirdParty,
  "Webpage": PageType.webPage
});

class MediaConfiguration {
  final String? entity;
  final String? category;
  final int? width;
  final int? height;
  final int? size;
  final bool? isDefault;
  final bool? withWatermark;
  final List<String>? extension;

  MediaConfiguration({
    this.entity,
    this.category,
    this.width,
    this.height,
    this.size,
    this.isDefault,
    this.withWatermark,
    this.extension,
  });

  factory MediaConfiguration.fromJson(Map<String, dynamic> json) => MediaConfiguration(
    entity: json["Entity"],
    category: json["Category"],
    width: json["Width"],
    height: json["Height"],
    size: json["Size"],
    isDefault: json["IsDefault"],
    withWatermark: json["WithWatermark"],
    extension: json["Extension"] == null ? [] : List<String>.from(json["Extension"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Entity": entity,
    "Category": category,
    "Width": width,
    "Height": height,
    "Size": size,
    "IsDefault": isDefault,
    "WithWatermark": withWatermark,
    "Extension": extension == null ? [] : List<dynamic>.from(extension!.map((x) => x)),
  };
}

class SocialAddress {
  final int? id;
  final String? facebookUrl;
  final dynamic instagramUrl;
  final dynamic youtubeUrl;
  final String? linkedinUrl;
  final dynamic twitterUrl;

  SocialAddress({
    this.id,
    this.facebookUrl,
    this.instagramUrl,
    this.youtubeUrl,
    this.linkedinUrl,
    this.twitterUrl,
  });

  factory SocialAddress.fromJson(Map<String, dynamic> json) => SocialAddress(
    id: json["Id"],
    facebookUrl: json["FacebookURL"],
    instagramUrl: json["InstagramURL"],
    youtubeUrl: json["YoutubeURL"],
    linkedinUrl: json["LinkedinURL"],
    twitterUrl: json["TwitterURL"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "FacebookURL": facebookUrl,
    "InstagramURL": instagramUrl,
    "YoutubeURL": youtubeUrl,
    "LinkedinURL": linkedinUrl,
    "TwitterURL": twitterUrl,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
