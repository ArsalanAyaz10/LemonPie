class Product {
  final String productName;
  final double price;
  final String currency;
  final String image;
  final double rating;
  final bool isAvailable;

  Product({
    required this.productName,
    required this.price,
    required this.currency,
    required this.image,
    required this.rating,
    required this.isAvailable,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['product_name'],
      price: double.parse(json['price'].toString()),
      currency: json['currency'],
      image: json['image'], // Base64 encoded image
      rating: double.parse(json['rating'].toString()),
      isAvailable: json['is_available'] == "1",
    );
  }
}
