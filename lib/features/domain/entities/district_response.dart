class DistrictResponse {
  final int? id;
  final int? divisionId;
  final String? name;
  final dynamic nameBn;
  final dynamic latitude;
  final dynamic longitude;
  final bool? isOperational;
  final num? deliveryCharge;
  final Status? status;

  DistrictResponse({
    this.id,
    this.divisionId,
    this.name,
    this.nameBn,
    this.latitude,
    this.longitude,
    this.isOperational,
    this.deliveryCharge,
    this.status,
  });

  factory DistrictResponse.fromJson(Map<String, dynamic> json) =>
      DistrictResponse(
        id: json["Id"],
        divisionId: json["DivisionId"],
        name: json["Name"],
        nameBn: json["NameBN"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        isOperational: json["IsOperational"],
        deliveryCharge: json["DeliveryCharge"],
        status: statusValues.map[json["Status"]]!,
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
        "Status": statusValues.reverse[status],
      };
}

enum Status { ACTIVE }

final statusValues = EnumValues({"Active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
