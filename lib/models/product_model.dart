import 'package:kopkar_mart/models/gallery_model.dart';

class ProductModel {
  int? productId;
  String? productName;
  int? price;
  int? stock;
  String? photo;
  List<GalleryModel>? gallery;

  ProductModel({
    this.productId,
    this.productName,
    this.price,
    this.stock,
    this.photo,
    this.gallery,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    price = json['price'];
    stock = json['stock'];
    photo = json['photo'];
    gallery = json['gallery']
        .map<GalleryModel>((gal) => GalleryModel.fromJson(gal))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "productName": productName,
      "price": price,
      "stock": stock,
      "photo": photo,
      "gallery": gallery!.map((gal) => gal.toJson()).toList(),
    };
  }
}
