class CancelModel {
  final String note;
  final int id;
  final String status;

  CancelModel({
    this.note = "",
    required this.id,
    this.status = "Canceled",
  });

  factory CancelModel.fromJson(Map<String, dynamic> json) => CancelModel(
        note: json["Note"],
        id: json["Id"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Note": note,
        "Id": id,
        "Status": status,
      };
}
