import 'package:fakestore/config/config.dart';
import 'package:fakestore/controller/product_controller.dart';
import 'package:fakestore/screen/widget/product_mobile.dart';
import 'package:fakestore/screen/widget/product_tablet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    productController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(screenWidth < 600 ? 'Mobile View' : 'Tablet View'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            var product = productController.products[index];
            if (screenWidth < 600) {
              return ProductMobile(product: product);
            } else {
              return ProductTablet(product: product);
            }
          },
        ),
      ),
    );
  }
}
