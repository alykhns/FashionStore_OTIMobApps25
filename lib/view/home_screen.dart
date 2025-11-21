import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:otimobapps25/controllers/theme_controllers.dart';
import 'package:otimobapps25/view/widgets/custom_search_bar.dart';
import 'package:otimobapps25/view/widgets/category_chips.dart';
import 'package:otimobapps25/view/widgets/sale_banner.dart';
import 'package:otimobapps25/view/widgets/product_grid.dart';

class  HomeScreen extends StatelessWidget {
  const  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:  SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children : [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Rafathin!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),   
                      ),
                    ],  
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.notifications_outlined),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                  GetBuilder<ThemeControllers>(
                    builder: (controller) => IconButton(
                      onPressed: controller.toggleTheme,
                      icon: Icon(
                        controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      ),
                    ),
                  ),
                ],
              )
            ),
            const CustomSearchBar(),
            const CategoryChips(),
            const SaleBanner(),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  GestureDetector(
                     onTap: (){},
                     child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: ProductGrid()),
          ],
        )
      )
    );
  }
}