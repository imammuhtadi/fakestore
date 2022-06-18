import 'package:fakestore/model/product.dart';
import 'package:fakestore/model/product_response.dart';
import 'package:fakestore/service/api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var products = <Product>[].obs;

  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await ApiService().get(path: 'products');
      var result = ProductResponse.fromJson(response);
      products.assignAll(result.products!);
    } finally {
      isLoading(false);
    }
  }
}
