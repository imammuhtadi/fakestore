import 'package:fakestore/controller/product_controller.dart';
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
    return const Scaffold();
  }
}
