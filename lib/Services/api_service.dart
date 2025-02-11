import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/Product.dart';

class ApiService {
  static const String baseUrl = "http://192.168.1.100/LemonPie/get_Product.php";

  static Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load products: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
