import 'dart:ui';

class Product {
  final String id;
  final String productName;
  final double price;
  final String currency;
  final String imageUrl;
  final double rating;
  final bool isAvailable;
  final Color cardColor;
  final Color textColor;
  final String categoryName;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.currency,
    required this.imageUrl,
    required this.rating,
    required this.isAvailable,
    required this.cardColor,
    required this.textColor,
    required this.categoryName,
  });

  // Convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'price': price,
      'currency': currency,
      'imageUrl': imageUrl,
      'rating': rating,
      'isAvailable': isAvailable,
      'cardColor': cardColor.value, // Store color as int
      'textColor': textColor.value,
      'categoryName': categoryName,
    };
  }

  // Create Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productName: json['productName'],
      price: json['price'],
      currency: json['currency'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
      isAvailable: json['isAvailable'],
      cardColor: Color(json['cardColor']),
      textColor: Color(json['textColor']),
      categoryName: json['categoryName'],
    );
  }
}
