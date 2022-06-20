import 'package:fakestore/model/product_response.dart';
import 'package:fakestore/service/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'fetch_product_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Fetch Product', () {
    test('returns an Product if the http call completes successfully',
        () async {
      final client = MockClient();

      var responseData =
          '[{"id": 1,"title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops","price": 109.95,"description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday","category": "mens clothing","image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg","rating": {"rate": 3.9,"count": 120}}]';

      when(client.get(Uri.parse('https://fakestoreapi.com/products')))
          .thenAnswer(
        (_) async => http.Response(responseData, 200),
      );

      expect(await fetchProducts(client), isA<ProductResponse>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      when(client.get(Uri.parse('https://fakestoreapi.com/products')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchProducts(client), throwsException);
    });
  });
}
