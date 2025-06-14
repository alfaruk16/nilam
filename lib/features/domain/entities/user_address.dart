class UserAddress {
  final int? id;
  final String? title;
  final String? name;
  final int? type;
  final String? email;
  final String? mobile;
  final String? countryCode;
  final int? divisionId;
  final int? districtId;
  final int? thanaId;
  final int? unionId;
  final String? address1;
  final String? address2;
  final String? placeId;
  final int? latitude;
  final int? longitude;
  final bool? isDefault;
  final bool? isPickupPoint;
  final String? divisionName;
  final String? districtName;
  final String? thanaName;
  final String? unionName;
  final Info? districtInfo;
  final Info? divisionInfo;

  const UserAddress({
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

  UserAddress copyWith({
    int? id,
    String? title,
    String? name,
    int? type,
    String? email,
    String? mobile,
    String? countryCode,
    int? divisionId,
    int? districtId,
    int? thanaId,
    int? unionId,
    String? address1,
    String? address2,
    String? placeId,
    int? latitude,
    int? longitude,
    bool? isDefault,
    bool? isPickupPoint,
    String? divisionName,
    String? districtName,
    String? thanaName,
    String? unionName,
    Info? districtInfo,
    Info? divisionInfo,
  }) =>
      UserAddress(
        id: id ?? this.id,
        title: title ?? this.title,
        name: name ?? this.name,
        type: type ?? this.type,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        countryCode: countryCode ?? this.countryCode,
        divisionId: divisionId ?? this.divisionId,
        districtId: districtId ?? this.districtId,
        thanaId: thanaId ?? this.thanaId,
        unionId: unionId ?? this.unionId,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        placeId: placeId ?? this.placeId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        isDefault: isDefault ?? this.isDefault,
        isPickupPoint: isPickupPoint ?? this.isPickupPoint,
        divisionName: divisionName ?? this.divisionName,
        districtName: districtName ?? this.districtName,
        thanaName: thanaName ?? this.thanaName,
        unionName: unionName ?? this.unionName,
        districtInfo: districtInfo ?? this.districtInfo,
        divisionInfo: divisionInfo ?? this.divisionInfo,
      );

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
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
    districtInfo: json["DistrictInfo"] == null ? null : Info.fromJson(json["DistrictInfo"]),
    divisionInfo: json["DivisionInfo"] == null ? null : Info.fromJson(json["DivisionInfo"]),
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
    "DistrictInfo": districtInfo?.toJson(),
    "DivisionInfo": divisionInfo?.toJson(),
  };
}

class Info {
  final int? id;
  final int? divisionId;
  final String? name;
  final String? nameBn;
  final int? latitude;
  final int? longitude;
  final bool? isOperational;
  final int? deliveryCharge;
  final String? status;
  final int? countryId;

  Info({
    this.id,
    this.divisionId,
    this.name,
    this.nameBn,
    this.latitude,
    this.longitude,
    this.isOperational,
    this.deliveryCharge,
    this.status,
    this.countryId,
  });

  Info copyWith({
    int? id,
    int? divisionId,
    String? name,
    String? nameBn,
    int? latitude,
    int? longitude,
    bool? isOperational,
    int? deliveryCharge,
    String? status,
    int? countryId,
  }) =>
      Info(
        id: id ?? this.id,
        divisionId: divisionId ?? this.divisionId,
        name: name ?? this.name,
        nameBn: nameBn ?? this.nameBn,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        isOperational: isOperational ?? this.isOperational,
        deliveryCharge: deliveryCharge ?? this.deliveryCharge,
        status: status ?? this.status,
        countryId: countryId ?? this.countryId,
      );

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    id: json["Id"],
    divisionId: json["DivisionId"],
    name: json["Name"],
    nameBn: json["NameBN"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    isOperational: json["IsOperational"],
    deliveryCharge: json["DeliveryCharge"],
    status: json["Status"],
    countryId: json["CountryId"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "DivisionId": divisionId,
    "Name": name,
    "NameBN": nameBn,
    "Latitude": latitude,
    "Longitude": longitude,
    "IsOperational": isOperational,
    "DeliveryCharge": deliveryCharge,
    "Status": status,
    "CountryId": countryId,
  };
}

class Company {
  final int? id;
  final String? companyName;
  final int? currentAddressId;
  final String? companySummary;
  final DateTime? establishedAt;
  final String? email;
  final String? contactNo;
  final String? hotline;
  final String? webUrl;
  final String? logoUrl;
  final int? socialAddressId;
  final String? bannerImageUrl;
  final String? status;

  Company({
    this.id,
    this.companyName,
    this.currentAddressId,
    this.companySummary,
    this.establishedAt,
    this.email,
    this.contactNo,
    this.hotline,
    this.webUrl,
    this.logoUrl,
    this.socialAddressId,
    this.bannerImageUrl,
    this.status,
  });

  Company copyWith({
    int? id,
    String? companyName,
    int? currentAddressId,
    String? companySummary,
    DateTime? establishedAt,
    String? email,
    String? contactNo,
    String? hotline,
    String? webUrl,
    String? logoUrl,
    int? socialAddressId,
    String? bannerImageUrl,
    String? status,
  }) =>
      Company(
        id: id ?? this.id,
        companyName: companyName ?? this.companyName,
        currentAddressId: currentAddressId ?? this.currentAddressId,
        companySummary: companySummary ?? this.companySummary,
        establishedAt: establishedAt ?? this.establishedAt,
        email: email ?? this.email,
        contactNo: contactNo ?? this.contactNo,
        hotline: hotline ?? this.hotline,
        webUrl: webUrl ?? this.webUrl,
        logoUrl: logoUrl ?? this.logoUrl,
        socialAddressId: socialAddressId ?? this.socialAddressId,
        bannerImageUrl: bannerImageUrl ?? this.bannerImageUrl,
        status: status ?? this.status,
      );

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["Id"],
    companyName: json["CompanyName"],
    currentAddressId: json["CurrentAddressId"],
    companySummary: json["CompanySummary"],
    establishedAt: json["EstablishedAt"] == null ? null : DateTime.parse(json["EstablishedAt"]),
    email: json["Email"],
    contactNo: json["ContactNo"],
    hotline: json["Hotline"],
    webUrl: json["WebUrl"],
    logoUrl: json["LogoUrl"],
    socialAddressId: json["SocialAddressId"],
    bannerImageUrl: json["BannerImageUrl"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CompanyName": companyName,
    "CurrentAddressId": currentAddressId,
    "CompanySummary": companySummary,
    "EstablishedAt": establishedAt?.toIso8601String(),
    "Email": email,
    "ContactNo": contactNo,
    "Hotline": hotline,
    "WebUrl": webUrl,
    "LogoUrl": logoUrl,
    "SocialAddressId": socialAddressId,
    "BannerImageUrl": bannerImageUrl,
    "Status": status,
  };
}

class Document {
  final int? id;
  final int? userId;
  final String? title;
  final String? uuid;
  final String? localPath;
  final String? filePath;
  final String? mimeType;
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

  Document copyWith({
    int? id,
    int? userId,
    String? title,
    String? uuid,
    String? localPath,
    String? filePath,
    String? mimeType,
    int? size,
    String? referenceType,
    int? referenceId,
    bool? isCover,
    int? sequence,
    bool? isApproved,
    List<OtherPath>? otherPath,
  }) =>
      Document(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        uuid: uuid ?? this.uuid,
        localPath: localPath ?? this.localPath,
        filePath: filePath ?? this.filePath,
        mimeType: mimeType ?? this.mimeType,
        size: size ?? this.size,
        referenceType: referenceType ?? this.referenceType,
        referenceId: referenceId ?? this.referenceId,
        isCover: isCover ?? this.isCover,
        sequence: sequence ?? this.sequence,
        isApproved: isApproved ?? this.isApproved,
        otherPath: otherPath ?? this.otherPath,
      );

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
    otherPath: json["OtherPath"] == null ? [] : List<OtherPath>.from(json["OtherPath"]!.map((x) => OtherPath.fromJson(x))),
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
    "OtherPath": otherPath == null ? [] : List<dynamic>.from(otherPath!.map((x) => x.toJson())),
  };
}

class OtherPath {
  final String? fileGroup;
  final String? filePath;

  OtherPath({
    this.fileGroup,
    this.filePath,
  });

  OtherPath copyWith({
    String? fileGroup,
    String? filePath,
  }) =>
      OtherPath(
        fileGroup: fileGroup ?? this.fileGroup,
        filePath: filePath ?? this.filePath,
      );

  factory OtherPath.fromJson(Map<String, dynamic> json) => OtherPath(
    fileGroup: json["FileGroup"],
    filePath: json["FilePath"],
  );

  Map<String, dynamic> toJson() => {
    "FileGroup": fileGroup,
    "FilePath": filePath,
  };
}

class Role {
  final int? id;
  final String? name;
  final int? grade;
  final String? description;
  final bool? isSystemRequired;
  final String? status;
  final List<String>? selectedMenus;
  final List<PermittedMenu>? permittedMenus;

  Role({
    this.id,
    this.name,
    this.grade,
    this.description,
    this.isSystemRequired,
    this.status,
    this.selectedMenus,
    this.permittedMenus,
  });

  Role copyWith({
    int? id,
    String? name,
    int? grade,
    String? description,
    bool? isSystemRequired,
    String? status,
    List<String>? selectedMenus,
    List<PermittedMenu>? permittedMenus,
  }) =>
      Role(
        id: id ?? this.id,
        name: name ?? this.name,
        grade: grade ?? this.grade,
        description: description ?? this.description,
        isSystemRequired: isSystemRequired ?? this.isSystemRequired,
        status: status ?? this.status,
        selectedMenus: selectedMenus ?? this.selectedMenus,
        permittedMenus: permittedMenus ?? this.permittedMenus,
      );

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["Id"],
    name: json["Name"],
    grade: json["Grade"],
    description: json["Description"],
    isSystemRequired: json["IsSystemRequired"],
    status: json["Status"],
    selectedMenus: json["SelectedMenus"] == null ? [] : List<String>.from(json["SelectedMenus"]!.map((x) => x)),
    permittedMenus: json["PermittedMenus"] == null ? [] : List<PermittedMenu>.from(json["PermittedMenus"]!.map((x) => PermittedMenu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Grade": grade,
    "Description": description,
    "IsSystemRequired": isSystemRequired,
    "Status": status,
    "SelectedMenus": selectedMenus == null ? [] : List<dynamic>.from(selectedMenus!.map((x) => x)),
    "PermittedMenus": permittedMenus == null ? [] : List<dynamic>.from(permittedMenus!.map((x) => x.toJson())),
  };
}

class PermittedMenu {
  final int? menuId;
  final int? roleId;
  final String? actions;
  final String? controller;

  PermittedMenu({
    this.menuId,
    this.roleId,
    this.actions,
    this.controller,
  });

  PermittedMenu copyWith({
    int? menuId,
    int? roleId,
    String? actions,
    String? controller,
  }) =>
      PermittedMenu(
        menuId: menuId ?? this.menuId,
        roleId: roleId ?? this.roleId,
        actions: actions ?? this.actions,
        controller: controller ?? this.controller,
      );

  factory PermittedMenu.fromJson(Map<String, dynamic> json) => PermittedMenu(
    menuId: json["MenuId"],
    roleId: json["RoleId"],
    actions: json["Actions"],
    controller: json["Controller"],
  );

  Map<String, dynamic> toJson() => {
    "MenuId": menuId,
    "RoleId": roleId,
    "Actions": actions,
    "Controller": controller,
  };
}

class SocialAddress {
  final int? id;
  final String? facebookUrl;
  final String? instagramUrl;
  final String? youtubeUrl;
  final String? linkedinUrl;
  final String? twitterUrl;

  SocialAddress({
    this.id,
    this.facebookUrl,
    this.instagramUrl,
    this.youtubeUrl,
    this.linkedinUrl,
    this.twitterUrl,
  });

  SocialAddress copyWith({
    int? id,
    String? facebookUrl,
    String? instagramUrl,
    String? youtubeUrl,
    String? linkedinUrl,
    String? twitterUrl,
  }) =>
      SocialAddress(
        id: id ?? this.id,
        facebookUrl: facebookUrl ?? this.facebookUrl,
        instagramUrl: instagramUrl ?? this.instagramUrl,
        youtubeUrl: youtubeUrl ?? this.youtubeUrl,
        linkedinUrl: linkedinUrl ?? this.linkedinUrl,
        twitterUrl: twitterUrl ?? this.twitterUrl,
      );

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
