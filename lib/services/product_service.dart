import 'dart:convert';

import 'package:kopkar_mart/helpers/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:kopkar_mart/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProduct(int page) async {
    String urlProduct = ApiHelper.URL_API_PRODUCT + "&page=${page.toString()}";

    var response = await http.get(Uri.parse(urlProduct));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['product'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      print(response.body);
      throw Exception("Gagal get Product !");
    }
  }
}
