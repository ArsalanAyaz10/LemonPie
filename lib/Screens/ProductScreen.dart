import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'HomeScreen.dart';
import 'cartScreen.dart';
import '../Model/Product.dart';


class Productscreen extends StatefulWidget {
  const Productscreen({super.key});



  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {

  bool isDark = false; // Default is light mode
  late PersistentTabController _controller = PersistentTabController(initialIndex: 0);


  List<Widget> _buildScreen(){
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
            screens: _buildScreen(),
            items: _navBarsItems(),
            backgroundColor: Colors.transparent,
            navBarStyle: NavBarStyle.style12 // Change style as needed
        ),
      ),
    );
  }
}


//PRODUCT SCREEN UI

class ProductUI extends StatefulWidget {
  const ProductUI({super.key});


  @override
  State<ProductUI> createState() => _ProductUIState();
}

class _ProductUIState extends State<ProductUI> {

  late Future<List<Product>> _futureProducts;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _futureProducts,
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                } else if(snapshot.hasError){
                  return Center(child: Text("Error: ${snapshot.error}"),);
                } else if(!snapshot.hasData || snapshot.data!.isEmpty){
                  return const Center(child: Text("No products available"));
                }

                List<Product> products = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
