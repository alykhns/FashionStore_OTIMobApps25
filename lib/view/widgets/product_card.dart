import 'package:flutter/material.dart';
import 'package:otimobapps25/models/product.dart';
import 'package:otimobapps25/utils/app_textstyles.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.9,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3), 
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16/9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite ? Theme.of(context).primaryColor : isDark ? Colors.grey[400] : Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
              if (product.oldPrice != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${calculateDiscount(product.price, product.oldPrice!)}% OFF  ',  
                      style: AppTextStyles.withColor(AppTextStyles.withWeight(
                        AppTextStyles.bodySmall,
                        FontWeight.bold,
                      ),
                      Colors.white,
                      ),
                    ),
                  ),
                ),
            ]
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyles.withColor(AppTextStyles.withWeight(
                    AppTextStyles.h3,
                    FontWeight.bold,
                  ),
                  Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01 ),
                Text(
                  product.category,
                  style: AppTextStyles.withColor(AppTextStyles.bodyMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01 ),
                Text(
                  product.category,
                  style: AppTextStyles.withColor(AppTextStyles.bodyMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                SizedBox(height: screenWidth * 0.02 ),
                Row(
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: AppTextStyles.withColor(AppTextStyles.withWeight(
                        AppTextStyles.bodyLarge,
                        FontWeight.bold,
                      ),
                      Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
                      ),
                    ),
                    if (product.oldPrice != null) ...[
                      SizedBox(width: screenWidth * 0.01 ),
                      Text(
                        '\$${product.oldPrice!.toStringAsFixed(2)}',
                        style: AppTextStyles.withColor(
                          AppTextStyles.bodySmall,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ).copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ]
                  ]
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

  int calculateDiscount(double currentPrice, double oldPrice){
      return ((oldPrice - currentPrice) / oldPrice * 100).round();
  }
}