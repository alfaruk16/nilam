import 'package:nilam/features/domain/entities/user_address.dart';

class Profile {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? displayId;
  final String? userName;
  final String? countryCode;
  final String? mobile;
  final String? email;
  final String? userType;
  final String? accountType;
  final String? profileImageUrl;
  final String? referralCode;
  final String? referrerId;
  final String? status;
  final bool? isVerified;
  final bool? isUseCompanySalesProfile;
  final String? dob;
  final String? gender;
  final String? emailVerifiedAt;
  final String? mobileVerifiedAt;
  final String? accountVerifiedAt;
  final num? positiveRating;
  final num? shippingRating;
  final num? responseRating;
  final num? defaultServiceCharge;
  final num? discountOnServiceCharge;
  final Company? company;
  final UserAddress? address;
  final SocialAddress? socialAddress;
  final String? referrer;
  final Role? role;
  final List<Document>? documents;
  final num? favoriteItemCount;
  final num? unReadNotificationCount;
  final num? cartItemsCount;
  final num? cartQuantityCount;

  const Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.displayId,
    this.userName,
    this.countryCode,
    this.mobile,
    this.email,
    this.userType,
    this.accountType,
    this.profileImageUrl,
    this.referralCode,
    this.referrerId,
    this.status,
    this.isVerified,
    this.isUseCompanySalesProfile,
    this.dob,
    this.gender,
    this.emailVerifiedAt,
    this.mobileVerifiedAt,
    this.accountVerifiedAt,
    this.positiveRating,
    this.shippingRating,
    this.responseRating,
    this.defaultServiceCharge,
    this.discountOnServiceCharge,
    this.company,
    this.address,
    this.socialAddress,
    this.referrer,
    this.role,
    this.documents,
    this.favoriteItemCount,
    this.unReadNotificationCount,
    this.cartItemsCount,
    this.cartQuantityCount,
  });

  Profile copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? displayId,
    String? userName,
    String? countryCode,
    String? mobile,
    String? email,
    String? userType,
    String? accountType,
    String? profileImageUrl,
    String? referralCode,
    String? referrerId,
    String? status,
    bool? isVerified,
    bool? isUseCompanySalesProfile,
    String? dob,
    String? gender,
    String? emailVerifiedAt,
    String? mobileVerifiedAt,
    String? accountVerifiedAt,
    num? positiveRating,
    num? shippingRating,
    num? responseRating,
    num? defaultServiceCharge,
    num? discountOnServiceCharge,
    Company? company,
    UserAddress? address,
    SocialAddress? socialAddress,
    String? referrer,
    Role? role,
    List<Document>? documents,
    num? favoriteItemCount,
    num? unReadNotificationCount,
    num? cartItemsCount,
    num? cartQuantityCount,
  }) =>
      Profile(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        displayId: displayId ?? this.displayId,
        userName: userName ?? this.userName,
        countryCode: countryCode ?? this.countryCode,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        userType: userType ?? this.userType,
        accountType: accountType ?? this.accountType,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        referralCode: referralCode ?? this.referralCode,
        referrerId: referrerId ?? this.referrerId,
        status: status ?? this.status,
        isVerified: isVerified ?? this.isVerified,
        isUseCompanySalesProfile:
            isUseCompanySalesProfile ?? this.isUseCompanySalesProfile,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        mobileVerifiedAt: mobileVerifiedAt ?? this.mobileVerifiedAt,
        accountVerifiedAt: accountVerifiedAt ?? this.accountVerifiedAt,
        positiveRating: positiveRating ?? this.positiveRating,
        shippingRating: shippingRating ?? this.shippingRating,
        responseRating: responseRating ?? this.responseRating,
        defaultServiceCharge: defaultServiceCharge ?? this.defaultServiceCharge,
        discountOnServiceCharge:
            discountOnServiceCharge ?? this.discountOnServiceCharge,
        company: company ?? this.company,
        address: address ?? this.address,
        socialAddress: socialAddress ?? this.socialAddress,
        referrer: referrer ?? this.referrer,
        role: role ?? this.role,
        documents: documents ?? this.documents,
        favoriteItemCount: favoriteItemCount ?? this.favoriteItemCount,
        unReadNotificationCount:
            unReadNotificationCount ?? this.unReadNotificationCount,
        cartItemsCount: cartItemsCount ?? this.cartItemsCount,
        cartQuantityCount: cartQuantityCount ?? this.cartQuantityCount,
      );

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        fullName: json["FullName"],
        displayId: json["DisplayId"],
        userName: json["UserName"],
        countryCode: json["CountryCode"],
        mobile: json["Mobile"],
        email: json["Email"],
        userType: json["UserType"],
        accountType: json["AccountType"],
        profileImageUrl: json["ProfileImageUrl"],
        referralCode: json["ReferralCode"],
        referrerId: json["ReferrerId"],
        status: json["Status"],
        isVerified: json["IsVerified"],
        isUseCompanySalesProfile: json["IsUseCompanySalesProfile"],
        dob: json["DOB"],
        gender: json["Gender"],
        emailVerifiedAt: json["EmailVerifiedAt"],
        mobileVerifiedAt: json["MobileVerifiedAt"],
        accountVerifiedAt: json["AccountVerifiedAt"],
        positiveRating: json["PositiveRating"],
        shippingRating: json["ShippingRating"],
        responseRating: json["ResponseRating"],
        defaultServiceCharge: json["DefaultServiceCharge"],
        discountOnServiceCharge: json["DiscountOnServiceCharge"],
        company:
            json["Company"] == null ? null : Company.fromJson(json["Company"]),
        address: json["Address"] == null
            ? null
            : UserAddress.fromJson(json["Address"]),
        socialAddress: json["SocialAddress"] == null
            ? null
            : SocialAddress.fromJson(json["SocialAddress"]),
        referrer: json["Referrer"],
        role: json["Role"] == null ? null : Role.fromJson(json["Role"]),
        documents: json["Documents"] == null
            ? []
            : List<Document>.from(
                json["Documents"]!.map((x) => Document.fromJson(x))),
        favoriteItemCount: json["FavoriteItemCount"],
        unReadNotificationCount: json["UnReadNotificationCount"],
        cartItemsCount: json["CartItemsCount"],
        cartQuantityCount: json["CartQuantityCount"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "FullName": fullName,
        "DisplayId": displayId,
        "UserName": userName,
        "CountryCode": countryCode,
        "Mobile": mobile,
        "Email": email,
        "UserType": userType,
        "AccountType": accountType,
        "ProfileImageUrl": profileImageUrl,
        "ReferralCode": referralCode,
        "ReferrerId": referrerId,
        "Status": status,
        "IsVerified": isVerified,
        "IsUseCompanySalesProfile": isUseCompanySalesProfile,
        "DOB": dob,
        "Gender": gender,
        "EmailVerifiedAt": emailVerifiedAt,
        "MobileVerifiedAt": mobileVerifiedAt,
        "AccountVerifiedAt": accountVerifiedAt,
        "PositiveRating": positiveRating,
        "ShippingRating": shippingRating,
        "ResponseRating": responseRating,
        "DefaultServiceCharge": defaultServiceCharge,
        "DiscountOnServiceCharge": discountOnServiceCharge,
        "Company": company?.toJson(),
        "Address": address?.toJson(),
        "SocialAddress": socialAddress?.toJson(),
        "Referrer": referrer,
        "Role": role?.toJson(),
        "Documents": documents == null
            ? []
            : List<dynamic>.from(documents!.map((x) => x.toJson())),
        "FavoriteItemCount": favoriteItemCount,
        "UnReadNotificationCount": unReadNotificationCount,
        "CartItemsCount": cartItemsCount,
        "CartQuantityCount": cartQuantityCount,
      };
}
