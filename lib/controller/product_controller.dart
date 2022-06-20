import 'package:fakestore/model/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fakestore/service/api_service.dart' as api_service;

class ProductController extends GetxController {
  var isLoading = false.obs;
  var products = <Product>[].obs;

  var client = http.Client();

  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await api_service.fetchProducts(client);
      products.assignAll(response.products ?? []);
    } finally {
      isLoading(false);
    }
  }
}
