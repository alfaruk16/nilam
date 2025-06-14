class OrderModel {
  final List<dynamic> dateRange;
  final String dateFrom;
  final String dateTo;
  final String keyword;
  final int page;
  final int length;
  final int type;

  OrderModel({
    this.dateRange = const [],
    this.dateFrom = "",
    this.dateTo = "",
    this.keyword = "",
    this.page = 1,
    this.length = 10,
    this.type = 2,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        dateRange: json["date_range"] == null
            ? []
            : List<dynamic>.from(json["date_range"]!.map((x) => x)),
        dateFrom: json["DateFrom"],
        dateTo: json["DateTo"],
        keyword: json["Keyword"],
        page: json["Page"],
        length: json["Length"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "date_range": List<dynamic>.from(dateRange.map((x) => x)),
        "DateFrom": dateFrom,
        "DateTo": dateTo,
        "Keyword": keyword,
        "Page": page,
        "Length": length,
        "Type": type,
      };
}
