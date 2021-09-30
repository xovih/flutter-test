import 'package:flutter/foundation.dart';
import 'package:kopkar_mart/models/product_model.dart';
// import 'package:kopkar_mart/services/product_service.dart';

class ProductProviderLama with ChangeNotifier {
  late ProductModel _productModel;

  ProductModel get productModel => _productModel;

  set productModel(ProductModel productModel) {
    _productModel = productModel;
    notifyListeners();
  }

  // Future<bool> getAllProduct(int page) async {
  //   try {
  //     ProductModel productModel = await ProductService().listProduct(page);
  //     _productModel = productModel;

  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // Future<bool> getDetailProduk(String sku) async {
  //   try {
  //     ProductModel productModel = await ProductService().detailProduct(sku);
  //     _productModel = productModel;

  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
