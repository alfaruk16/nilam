class CartResponse {
  final List<CartItem>? items;
  final List<dynamic>? coupon;

  const CartResponse({
    this.items,
    this.coupon,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        items: json["Items"] == null
            ? []
            : List<CartItem>.from(
                json["Items"]!.map((x) => CartItem.fromJson(x))),
        coupon: json["Coupon"] == null
            ? []
            : List<dynamic>.from(json["Coupon"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "Coupon":
            coupon == null ? [] : List<dynamic>.from(coupon!.map((x) => x)),
      };
}

class CartItem {
  final int? id;
  final int? itemId;
  final dynamic sku;
  final num? measurementId;
  final num? cartQuantity;
  final num? stockQuantity;
  final String? selectedAttributes;
  final List<dynamic>? attributes;
  final num? categoryId;
  final String? categoryName;
  final String? condition;
  final String? imageUrl;
  final String? itemName;
  final String? brandName;
  final String? measurementName;
  final num? salesPrice;
  final num? discountedPrice;
  final num? freeQuantity;
  final num? discountAmount;
  final num? shippingCharge;
  final num? netTotal;
  final dynamic remarks;
  final num? sellerId;
  final bool? isSelected;
  final String? discountTag;
  final String? slug;

  const CartItem({
    this.id,
    this.itemId,
    this.sku,
    this.measurementId,
    this.cartQuantity,
    this.stockQuantity,
    this.selectedAttributes,
    this.attributes,
    this.categoryId,
    this.categoryName,
    this.condition,
    this.imageUrl,
    this.itemName,
    this.brandName,
    this.measurementName,
    this.salesPrice,
    this.discountedPrice,
    this.freeQuantity,
    this.discountAmount,
    this.shippingCharge,
    this.netTotal,
    this.remarks,
    this.sellerId,
    this.isSelected,
    this.discountTag,
    this.slug,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["Id"],
        itemId: json["ItemId"],
        sku: json["SKU"],
        measurementId: json["MeasurementId"],
        cartQuantity: json["CartQuantity"],
        stockQuantity: json["StockQuantity"],
        selectedAttributes: json["SelectedAttributes"],
        attributes: json["Attributes"] == null
            ? []
            : List<dynamic>.from(json["Attributes"]!.map((x) => x)),
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        condition: json["Condition"],
        imageUrl: json["ImageUrl"],
        itemName: json["ItemName"],
        brandName: json["BrandName"],
        measurementName: json["MeasurementName"],
        salesPrice: json["SalesPrice"],
        discountedPrice: json["DiscountedPrice"],
        freeQuantity: json["FreeQuantity"],
        discountAmount: json["DiscountAmount"],
        shippingCharge: json["ShippingCharge"],
        netTotal: json["NetTotal"],
        remarks: json["Remarks"],
        sellerId: json["SellerId"],
        isSelected: json["IsSelected"],
        discountTag: json["DiscountTag"],
        slug: json["Slug"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ItemId": itemId,
        "SKU": sku,
        "MeasurementId": measurementId,
        "CartQuantity": cartQuantity,
        "StockQuantity": stockQuantity,
        "SelectedAttributes": selectedAttributes,
        "Attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x)),
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "Condition": condition,
        "ImageUrl": imageUrl,
        "ItemName": itemName,
        "BrandName": brandName,
        "MeasurementName": measurementName,
        "SalesPrice": salesPrice,
        "DiscountedPrice": discountedPrice,
        "FreeQuantity": freeQuantity,
        "DiscountAmount": discountAmount,
        "ShippingCharge": shippingCharge,
        "NetTotal": netTotal,
        "Remarks": remarks,
        "SellerId": sellerId,
        "IsSelected": isSelected,
        "DiscountTag": discountTag,
        "Slug": slug,
      };
}
