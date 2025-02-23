import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/Product.dart';

class ApiService {
  static Future<List<Product>> fetchProducts() async {
    try {
      // Get reference to Firestore collection
      CollectionReference productsCollection =
      FirebaseFirestore.instance.collection("products");

      // Fetch all documents from the "products" collection
      QuerySnapshot querySnapshot = await productsCollection.get();

      // Convert Firestore documents into a list of Product objects
      List<Product> products = querySnapshot.docs.map((doc) {
        return Product.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      if (products.isEmpty) {
        throw Exception("No products found.");
      }

      return products;
    } catch (e) {
      throw Exception("Firestore Error: $e");
    }
  }
}
