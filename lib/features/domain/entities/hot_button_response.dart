class HotButtonResponse {
  final int? id;
  final String? title;
  final String? titleBn;
  final String? iconPath;
  final String? link;
  final int? sequence;
  final String? status;
  final dynamic file;

  HotButtonResponse({
    this.id,
    this.title,
    this.titleBn,
    this.iconPath,
    this.link,
    this.sequence,
    this.status,
    this.file,
  });

  factory HotButtonResponse.fromJson(Map<String, dynamic> json) => HotButtonResponse(
    id: json["Id"],
    title: json["Title"],
    titleBn: json["TitleBN"],
    iconPath: json["IconPath"],
    link: json["Link"],
    sequence: json["Sequence"],
    status: json["Status"],
    file: json["File"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "TitleBN": titleBn,
    "IconPath": iconPath,
    "Link": link,
    "Sequence": sequence,
    "Status": status,
    "File": file,
  };
}
