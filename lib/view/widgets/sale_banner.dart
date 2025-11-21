import 'package:flutter/material.dart';
import 'package:otimobapps25/utils/app_textstyles.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.70),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Sale Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Icon(
              Icons.local_offer,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(width: 16.0),
          // Sale Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Your',
                  style: AppTextStyles.withColor(
                    AppTextStyles.h3,
                    Colors.white
                  ),
                ),
                Text(
                  'Special Sale',
                  style: AppTextStyles.withColor(
                    AppTextStyles.withWeight(
                      AppTextStyles.h2, 
                      FontWeight.bold
                    ),
                    Colors.white,
                  ),
                ),
                Text(
                  'Up to 70%',
                  style: AppTextStyles.withColor(
                    AppTextStyles.h3,
                    Colors.white,
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: (){

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
            ),
            child: Text(
              'Shop Now',
              style: AppTextStyles.buttonMedium,

              ),
            ),
        ],
      ),
    );
  }
}