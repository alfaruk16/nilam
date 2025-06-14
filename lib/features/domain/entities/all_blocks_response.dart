class BlockResponse {
  final int? id;
  final String? name;
  final dynamic areaName;
  final dynamic controllerName;
  final dynamic actionName;
  final String? apiLink;
  final String? detailsLink;
  final String? sectionType;
  final DateTime? startAt;
  final DateTime? endAt;
  final bool? isTimerShow;
  final bool? isNameShow;
  final bool? isCampaign;
  final int? campaignId;
  final int? sequence;
  final bool? isForWeb;
  final bool? isForMobile;
  final int? grid;

  const BlockResponse({
    this.id,
    this.name,
    this.areaName,
    this.controllerName,
    this.actionName,
    this.apiLink,
    this.detailsLink,
    this.sectionType,
    this.startAt,
    this.endAt,
    this.isTimerShow,
    this.isNameShow,
    this.isCampaign,
    this.campaignId,
    this.sequence,
    this.isForWeb,
    this.isForMobile,
    this.grid,
  });

  factory BlockResponse.fromJson(Map<String, dynamic> json) => BlockResponse(
    id: json["Id"],
    name: json["Name"],
    areaName: json["AreaName"],
    controllerName: json["ControllerName"],
    actionName: json["ActionName"],
    apiLink: json["ApiLink"],
    detailsLink: json["DetailsLink"],
    sectionType: json["SectionType"],
    startAt: json["StartAt"] == null ? null : DateTime.parse(json["StartAt"]),
    endAt: json["EndAt"] == null ? null : DateTime.parse(json["EndAt"]),
    isTimerShow: json["IsTimerShow"],
    isNameShow: json["IsNameShow"],
    isCampaign: json["IsCampaign"],
    campaignId: json["CampaignId"],
    sequence: json["Sequence"],
    isForWeb: json["IsForWeb"],
    isForMobile: json["IsForMobile"],
    grid: json["Grid"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "AreaName": areaName,
    "ControllerName": controllerName,
    "ActionName": actionName,
    "ApiLink": apiLink,
    "DetailsLink": detailsLink,
    "SectionType": sectionType,
    "StartAt": startAt?.toIso8601String(),
    "EndAt": endAt?.toIso8601String(),
    "IsTimerShow": isTimerShow,
    "IsNameShow": isNameShow,
    "IsCampaign": isCampaign,
    "CampaignId": campaignId,
    "Sequence": sequence,
    "IsForWeb": isForWeb,
    "IsForMobile": isForMobile,
    "Grid": grid,
  };
}
