import 'package:flutter/material.dart';
import 'package:furniture_app/core/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Hero(tag: product.id, child: Image.asset(product.productImg),),),
          ],
        ),
      ),
    );
  }
}
