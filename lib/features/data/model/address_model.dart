class UpdateAddressModel {
  final int? id;
  final String address1;
  final int districtId;
  final int divisionId;
  final String mobile;
  final String name;
  final String title;
  final String? email;

  UpdateAddressModel({
    this.id,
    required this.address1,
    required this.districtId,
    required this.divisionId,
    required this.mobile,
    required this.name,
    required this.title,
    this.email,
  });

  factory UpdateAddressModel.fromJson(Map<String, dynamic> json) =>
      UpdateAddressModel(
        id: json["Id"],
        address1: json["Address1"],
        districtId: json["DistrictId"],
        divisionId: json["DivisionId"],
        mobile: json["Mobile"],
        name: json["Name"],
        title: json["Title"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Address1": address1,
        "DistrictId": districtId,
        "DivisionId": divisionId,
        "Mobile": mobile,
        "Name": name,
        "Title": title,
        "Email": email,
      };
}

class AddAddressModel {
  final String address1;
  final int districtId;
  final int divisionId;
  final String mobile;
  final String name;
  final String title;
  final String? email;

  AddAddressModel({
    required this.address1,
    required this.districtId,
    required this.divisionId,
    required this.mobile,
    required this.name,
    required this.title,
    this.email,
  });

  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      AddAddressModel(
        address1: json["Address1"],
        districtId: json["DistrictId"],
        divisionId: json["DivisionId"],
        mobile: json["Mobile"],
        name: json["Name"],
        title: json["Title"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "Address1": address1,
        "DistrictId": districtId,
        "DivisionId": divisionId,
        "Mobile": mobile,
        "Name": name,
        "Title": title,
        "Email": email,
      };
}
