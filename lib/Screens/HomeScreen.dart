import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_product_card/flutter_product_card.dart';
import 'package:lemonpieui/Screens/ProfileScreen.dart';
import 'package:lemonpieui/Screens/cartScreen.dart';
import 'package:lemonpieui/Screens/loginScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../Model/Product.dart';
import '../Services/api_service.dart';
import 'ProductScreen.dart';
import 'SettingsScreen.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _BuildScreen(){
    return[
      const HomeUI(), // Home screen
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
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.logout),
        title: "Logout",
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
        onPressed: (context) {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.pushAndRemoveUntil(
              context!,
              MaterialPageRoute(builder: (context) => const Loginscreen()),
                  (Route<dynamic> route) => false,
            );
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _BuildScreen(),
        items: _navBarsItems(),
        backgroundColor: Colors.transparent,
        navBarStyle: NavBarStyle.style12,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Your Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Loginscreen()),
                        (Route<dynamic> route) => false,
                  );
                });
              },
            ),
          ],
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
              InkWell(
                onTap: (){
                  Drawer();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.black26,
                  foregroundColor: Colors.yellowAccent,
                  child: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              const SearchBar(
                elevation: WidgetStatePropertyAll(3),
                hintText: "Search items",
                padding: WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                enabled: true,
                backgroundColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 250, 250, 250)),
                leading: Icon(Icons.search),
              ),
              const SizedBox(height: 10),

              // Single FutureBuilder for all categories
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

                  // Define categories once
                  List<String> categories = ["Cakes", "Cookies", "Biscuits", "Pastries", "Desserts"];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: categories.map((category)
                    {
                      List<Product> categoryProducts = products
                          .where((product) => product.category == category)
                          .toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            category,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 10),
                          categoryProducts.isEmpty
                              ? const Center(child: Text("No products available"))
                              : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoryProducts
                                  .map((product) => SizedBox(
                                width: 200,
                                height: 340,
                                child: ProductCard(
                                  imageUrl: product.imageUrl,
                                  productName: product.productName,
                                  width: 200,
                                  height: 355,
                                  price: product.price,
                                  currency: product.currency,
                                  rating: product.rating,
                                  isAvailable: product.isAvailable,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductScreen(product: product),
                                      ),
                                    );
                                  },
                                  onFavoritePressed: () {},
                                  cardColor: Colors.white,
                                  textColor: Colors.black,
                                  categoryName: product.category,
                                  discountPercentage: 25,
                                ),
                              ))
                                  .toList(),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
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

