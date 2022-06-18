// ignore_for_file: unnecessary_this

import 'package:fakestore/model/product.dart';

class ProductResponse {
  List<Product>? products;

  ProductResponse({this.products});

  ProductResponse.fromJson(List<dynamic>? json) {
    if (json != null) {
      products = <Product>[];
      for (var v in json) {
        products!.add(Product.fromJson(v));
      }
    }
  }
}
