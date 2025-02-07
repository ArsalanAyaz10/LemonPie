import 'package:flutter/material.dart';
import 'package:flutter_product_card/flutter_product_card.dart';

import 'loginScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isDark = false; // Default is light mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("LemonPie"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isDark = !isDark; // Toggle theme
                });
              },
              icon: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color: Colors.black87,
              ),
            ),
            Icon(
              Icons.shopping_cart_sharp,
              color: isDark ? Colors.white : Colors.black, // Changes color dynamically
            ),
          ],
        ),
        body: const HomeUI(),
      ),
    );
  }
}

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView( // En
        scrollDirection: Axis.vertical,// ables scrolling to avoid overflow
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Crave Choose Cherish!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              const SearchBar(
                elevation: WidgetStatePropertyAll(3),
                hintText: "Search items",
                padding: WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                enabled: true,
                backgroundColor:
                WidgetStatePropertyAll(Color.fromARGB(255, 250, 250, 250)),
                leading: Icon(Icons.search),
              ),
              const SizedBox(height: 10),
              const Text(
                "Popular Items",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductCard(
                      productName: "Blue-Berry Pie",
                      width: 200,
                      height: 320,
                      price: 19.99,
                      currency: "\$",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Loginscreen()),
                        );
                      },
                      imageUrl:
                      "https://media.istockphoto.com/id/2169276230/photo/apple-pie.jpg?s=2048x2048&w=is&k=20&c=tsNpCPX_ZaUWYdKIGaRd9RDOBB9xhweM8HlgpsRUrd8=",
                      onFavoritePressed: () {},
                      rating: 4.2,
                      isAvailable: true,
                      cardColor: Colors.white,
                      textColor: Colors.black,
                      categoryName: '',
                    ),
                    ProductCard(
                      productName: "Chocolate Bagel",
                      width: 200,
                      height: 320,
                      price: 13.99,
                      currency: "\$",
                      onTap: () {},
                      imageUrl:
                      "https://nourishingniki.com/wp-content/uploads/2024/06/Chocolate-Bagels-17-768x1024.jpg",
                      onFavoritePressed: () {},
                      rating: 4.0,
                      isAvailable: true,
                      cardColor: Colors.white,
                      textColor: Colors.black,
                      categoryName: '',
                    ),
                    ProductCard(
                      productName: "French Croissants",
                      width: 200,
                      height: 320,
                      price: 9.59,
                      currency: "\$",
                      onTap: () {},
                      imageUrl: "https://media.istockphoto.com/id/1456564684/photo/three-stacked-fresh-croissants-french-bakery-sweet-dough-dessert-composition-with-crumbs.jpg?s=2048x2048&w=is&k=20&c=T0Ek9fH6jKsJWbAVCvFQCk21RsY7che5MfWj6IUjz58=",
                      onFavoritePressed: () {},
                      rating: 4.9,
                      isAvailable: true,
                      cardColor: Colors.white,
                      textColor: Colors.black,
                      categoryName: '',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Text(
                    textAlign: TextAlign.right,
                    "See All",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductCard(
                      productName: "Blue-Berry Pie",
                      width: 200,
                      height: 320,
                      price: 19.99,
                      currency: "\$",
                      onTap: () {},
                      imageUrl:
                      "https://media.istockphoto.com/id/2169276230/photo/apple-pie.jpg?s=2048x2048&w=is&k=20&c=tsNpCPX_ZaUWYdKIGaRd9RDOBB9xhweM8HlgpsRUrd8=",
                      onFavoritePressed: () {},
                      rating: 4.2,
                      isAvailable: true,
                      cardColor: Colors.white,
                      textColor: Colors.black,
                      categoryName: '',
                    ),
                    ProductCard(
                      productName: "Chocolate Bagel",
                      width: 200,
                      height: 320,
                      price: 13.99,
                      currency: "\$",
                      onTap: () {},
                      imageUrl:
                      "https://nourishingniki.com/wp-content/uploads/2024/06/Chocolate-Bagels-17-768x1024.jpg",
                      onFavoritePressed: () {},
                      rating: 4.0,
                      isAvailable: true,
                      cardColor: Colors.white,
                      textColor: Colors.black,
                      categoryName: '',
                    ),
                    ProductCard(
                      productName: "French Croissants",
                      width: 200,
                      height: 320,
                      price: 9.59,
                      currency: "\$",
                      onTap: () {},
                      imageUrl: "https://media.istockphoto.com/id/1456564684/photo/three-stacked-fresh-croissants-french-bakery-sweet-dough-dessert-composition-with-crumbs.jpg?s=2048x2048&w=is&k=20&c=T0Ek9fH6jKsJWbAVCvFQCk21RsY7che5MfWj6IUjz58=",
                      onFavoritePressed: () {},
                      rating: 4.9,
                      isAvailable: true,
                      cardColor: Colors.white,
                      textColor: Colors.black,
                      categoryName: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
