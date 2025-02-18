class Product {
  final String productId;
  final String productName;
  final double price;
  final String currency;
  final String imageUrl;
  final double rating;
  final bool isAvailable;
  final String category;

  Product({
    required this.productId,
    required this.category,
    required this.productName,
    required this.price,
    required this.currency,
    required this.imageUrl,
    required this.rating,
    required this.isAvailable,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id']?.toString() ?? "",
      productName: json['product_name'] ?? "Unknown",
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      currency: json['currency'] ?? "USD",
      imageUrl: json['image'] ?? "",
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      isAvailable: json['is_available'].toString() == "1" || json['is_available'] == 1,
      category: json['category'] ?? "",
    );
  }
}
