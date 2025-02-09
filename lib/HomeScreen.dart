import 'package:flutter/material.dart';
import 'package:flutter_product_card/flutter_product_card.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'emailVerifyScreen.dart';
import 'loginScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isDark = false; // Default is light mode
 late PersistentTabController _controller = PersistentTabController(initialIndex: 0);

 List<Widget> _BuildScreen(){
   return[
     const HomeUI(), // Home screen
     const Center(child: Text("Menu"),),
     const Center(child: Text("Cart")),
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
                      price: 500,
                      currency: "\Rs.",
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
                      price:660,
                      currency: "\Rs.",
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
                      price: 650,
                      currency: "\Rs.",
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
                      productName: "Kheer",
                      width: 200,
                      height: 320,
                      price: 300,
                      currency: "\Rs.",
                      onTap: () {},
                      imageUrl:
                      "https://untoldrecipesbynosheen.com/wp-content/uploads/2024/05/kheer-main-2.jpg",
                      onFavoritePressed: () {},
                      rating: 4.2,
                      isAvailable: true,
                      cardColor: Colors.white,
                      textColor: Colors.black,
                      categoryName: '',
                    ),
                    ProductCard(
                      productName: "Kulfa",
                      width: 200,
                      height: 320,
                      price: 200,
                      currency: "\Rs.",
                      onTap: () {},
                      imageUrl:
                      "https://untoldrecipesbynosheen.com/wp-content/uploads/2023/06/kulfi-main-2-scaled.jpg",
                      onFavoritePressed: () {},
                      rating: 4.0,
                      isAvailable: true,
                      cardColor: Colors.white,
                      textColor: Colors.black,
                      categoryName: '',
                    ),
                    ProductCard(
                      productName: "Halwa",
                      width: 200,
                      height: 320,
                      price: 150,
                      currency: "\Rs.",
                      onTap: () {},
                      imageUrl: "https://untoldrecipesbynosheen.com/wp-content/uploads/2022/10/pumpkin-halwa-main-1.jpg",
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