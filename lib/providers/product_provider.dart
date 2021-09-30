import 'package:flutter/foundation.dart';
import 'package:kopkar_mart/models/product_model.dart';
import 'package:kopkar_mart/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<bool> getProduct(int page) async {
    try {
      List<ProductModel> products = await ProductService().getProduct(page);
      _products = products;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
