import 'dart:convert';
import 'package:fakestore/config/config.dart';
import 'package:fakestore/model/product_response.dart';
import 'package:http/http.dart' as http;

Future<ProductResponse> fetchProducts(http.Client client) async {
  final response = await client.get(Uri.parse(
    ConfigApps.baseUrl + 'products',
  ));
  if (response.statusCode == 200) {
    return ProductResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load products');
  }
}
