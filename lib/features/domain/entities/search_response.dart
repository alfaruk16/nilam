import 'package:nilam/features/domain/entities/product_response.dart';

class SearchResponse {
  final int? draw;
  final int? recordsTotal;
  final int? recordsFiltered;
  final List<Product>? data;
  final dynamic error;
  final dynamic partialView;
  final int? page;
  final int? length;
  final int? totalPage;
  final int? otherCount;

  const SearchResponse({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
    this.error,
    this.partialView,
    this.page,
    this.length,
    this.totalPage,
    this.otherCount,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        draw: json["Draw"],
        recordsTotal: json["recordsTotal"],
        recordsFiltered: json["recordsFiltered"],
        data: json["data"] == null
            ? []
            : List<Product>.from(
                json["data"]!.map((x) => Product.fromJson(x))),
        error: json["Error"],
        partialView: json["PartialView"],
        page: json["Page"],
        length: json["Length"],
        totalPage: json["TotalPage"],
        otherCount: json["OtherCount"],
      );

  Map<String, dynamic> toJson() => {
        "Draw": draw,
        "recordsTotal": recordsTotal,
        "recordsFiltered": recordsFiltered,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "Error": error,
        "PartialView": partialView,
        "Page": page,
        "Length": length,
        "TotalPage": totalPage,
        "OtherCount": otherCount,
      };
}
