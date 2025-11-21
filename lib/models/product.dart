class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  const Product({
    required this.category,
    required this.description,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.oldPrice,
    this.isFavorite = false,
  });
}

final List<Product> demoProducts = [
  const Product(
    name: 'Shoes',
    category: 'Footwear',
    price: 69.99,
    oldPrice: 189.99,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'Cool shoes to go to college and walk around comfortably all day long.',
  ),
  const Product(
    name: 'Laptop',
    category: 'Electronics',
    price: 69.99,
    oldPrice: 189.99,
    imageUrl: 'assets/images/laptop.jpg',
    description: 'Best laptop for work and entertainment with high performance and sleek design.',
  ),
  const Product(
    name: 'Air  Jordan',
    category: 'Footwear',
    price: 24.99,
    oldPrice: 34.99,
    imageUrl: 'assets/images/shoes2.jpg',
    description: 'Cool shoes to meet social standard.',
  ),
  const Product(
    name: 'New Balance', 
    category: 'Footwear',
    price: 99.99,
    oldPrice: 149.99,
    imageUrl: 'assets/images/shoe2.jpg',
    description: 'Comfortable shoes for running and casual wear.',
  ),
];