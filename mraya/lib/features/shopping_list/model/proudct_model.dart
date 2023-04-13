class ProudctModel {
  String item;
  String productDetails;
  String color;
  String price;
  String imageUrl;
  String id;

  ProudctModel({
    required this.item,
    required this.productDetails,
    required this.color,
    required this.price,
    required this.imageUrl,
    required this.id,
  });

  factory ProudctModel.fromJson(Map<String, dynamic> json) => ProudctModel(
        item: json["item"],
        productDetails: json["productDetails"],
        color: json["color"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "productDetails": productDetails,
        "color": color,
        "price": price,
        "imageUrl": imageUrl,
        "id": id,
      };
}

