import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_product_card/flutter_product_card.dart';
import 'package:lemonpieui/Screens/cart.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../Model/Product.dart';
import '../Services/api_service.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isDark = false; // Default is light mode
 late final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

 List<Widget> _BuildScreen(){
   return[
     const HomeUI(), // Home screen
     const Center(child: Text("Menu"),),
     const CartUI(),
   ];
 }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.brown,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.restaurant_menu),
        title: "Menu",
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: "Cart",
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),

    ];
  }

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
      title: const Text(
      "LemonPie",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent, // Transparent background
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFff9a9e), Color(0xFFfad0c4)], // Gradient effect
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      elevation: 4, // Slight shadow for depth
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: IconButton(
          icon: const Icon(Icons.arrow_back, size: 26),
          onPressed: () {
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 19,
            backgroundColor: Colors.white, // Light background for contrast
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.black), // Profile icon
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    ),

    body: PersistentTabView(
          context,
          controller: _controller,
          screens: _BuildScreen(),
          items: _navBarsItems(),
          backgroundColor: Colors.transparent,
          navBarStyle: NavBarStyle.style12 // Change style as needed
        ),
      ),
    );
  }
}


class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = ApiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Crave Choose Cherish!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),

              FutureBuilder<List<Product>>(
                future: _futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No products available"));
                  }
                  List<Product> products = snapshot.data!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: Row(
                      children: products
                          .map((product) => ProductCard(
                        imageUrl: product.imageUrl,
                        productName: product.productName,
                        width: 200,
                        height: 320,
                        price: product.price,
                        currency: product.currency,
                        rating: product.rating,
                        isAvailable: product.isAvailable,
                        onTap: () {},
                        onFavoritePressed: () {},
                        cardColor: Colors.white,
                        textColor: Colors.black,
                        categoryName: '',
                      ))
                          .toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
