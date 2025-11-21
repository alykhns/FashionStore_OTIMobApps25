import 'package:flutter/material.dart';
import 'package:otimobapps25/models/product.dart';
import 'package:otimobapps25/view/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: demoProducts.length,
      itemBuilder: (context, index) {
        final product = demoProducts[index];
        return GestureDetector(
          onTap: (){},
          child: ProductCard(product: product),
        );
      }
    );
  }
} 