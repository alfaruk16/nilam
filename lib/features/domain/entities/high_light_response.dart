class HighlightResponse {
  final int? id;
  final int? groupId;
  final String? groupName;
  final String? title;
  final String? titleBn;
  final String? detailsLink;
  final int? sequence;
  final String? status;
  final List<HighlightSectionDetailDto>? highlightSectionDetailDtos;

  HighlightResponse({
    this.id,
    this.groupId,
    this.groupName,
    this.title,
    this.titleBn,
    this.detailsLink,
    this.sequence,
    this.status,
    this.highlightSectionDetailDtos,
  });

  factory HighlightResponse.fromJson(Map<String, dynamic> json) =>
      HighlightResponse(
        id: json["Id"],
        groupId: json["GroupId"],
        groupName: json["GroupName"],
        title: json["Title"],
        titleBn: json["TitleBN"],
        detailsLink: json["DetailsLink"],
        sequence: json["Sequence"],
        status: json["Status"],
        highlightSectionDetailDtos: json["HighlightSectionDetailDtos"] == null
            ? []
            : List<HighlightSectionDetailDto>.from(
                json["HighlightSectionDetailDtos"]!
                    .map((x) => HighlightSectionDetailDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "GroupId": groupId,
        "GroupName": groupName,
        "Title": title,
        "TitleBN": titleBn,
        "DetailsLink": detailsLink,
        "Sequence": sequence,
        "Status": status,
        "HighlightSectionDetailDtos": highlightSectionDetailDtos == null
            ? []
            : List<dynamic>.from(
                highlightSectionDetailDtos!.map((x) => x.toJson())),
      };
}

class HighlightSectionDetailDto {
  final int? id;
  final String? imageLink;
  final dynamic file;
  final num? discount;
  final String? documentTitle;
  final String? uuid;
  final String? filePath;
  final dynamic highlightSectionDto;

  HighlightSectionDetailDto({
    this.id,
    this.imageLink,
    this.file,
    this.discount,
    this.documentTitle,
    this.uuid,
    this.filePath,
    this.highlightSectionDto,
  });

  factory HighlightSectionDetailDto.fromJson(Map<String, dynamic> json) =>
      HighlightSectionDetailDto(
        id: json["Id"],
        imageLink: json["ImageLink"],
        file: json["File"],
        discount: json["Discount"],
        documentTitle: json["DocumentTitle"],
        uuid: json["UUID"],
        filePath: json["FilePath"],
        highlightSectionDto: json["HighlightSectionDto"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ImageLink": imageLink,
        "File": file,
        "Discount": discount,
        "DocumentTitle": documentTitle,
        "UUID": uuid,
        "FilePath": filePath,
        "HighlightSectionDto": highlightSectionDto,
      };
}
