import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Hero(
              tag: product.id,
              child: Image.network(product.image, height: 100),
            ),
            Text(product.name),
            Text("R\$ ${product.price}"),
          ],
        ),
      ),
    );
  }
}
