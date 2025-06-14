class DivisionResponse {
  final int? id;
  final String? name;
  final dynamic nameBn;
  final int? countryId;
  final dynamic latitude;
  final dynamic longitude;
  final bool? isOperational;
  final String? status;

  const DivisionResponse({
    this.id,
    this.name,
    this.nameBn,
    this.countryId,
    this.latitude,
    this.longitude,
    this.isOperational,
    this.status,
  });

  factory DivisionResponse.fromJson(Map<String, dynamic> json) => DivisionResponse(
    id: json["Id"],
    name: json["Name"],
    nameBn: json["NameBN"],
    countryId: json["CountryId"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    isOperational: json["IsOperational"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "NameBN": nameBn,
    "CountryId": countryId,
    "Latitude": latitude,
    "Longitude": longitude,
    "IsOperational": isOperational,
    "Status": status,
  };
}
