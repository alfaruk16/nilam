class GetUrlModel {
  String? referanceType;
  int? referanceId;
  num? amount;
  bool? isAvailEmi;

  GetUrlModel({this.referanceType, this.referanceId, this.amount, this.isAvailEmi});

  GetUrlModel.fromJson(Map<String, dynamic> json) {
    referanceType = json['ReferanceType'];
    referanceId = json['ReferanceId'];
    amount = json['Amount'];
    isAvailEmi = json['IsAvailEmi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ReferanceType'] = referanceType;
    data['ReferanceId'] = referanceId;
    data['Amount'] = amount;
    data['IsAvailEmi'] = isAvailEmi;
    return data;
  }
}
