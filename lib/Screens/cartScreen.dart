import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'HomeScreen.dart';
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
      const CartUI(),
      const Loginscreen(),
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: PersistentTabView(
              context,
              controller: _controller,
              screens: _BuildScreen(),
              items: _navBarsItems(),
              navBarStyle: NavBarStyle.style12 // Change style as needed
          ),
        ),
      );
  }
}

class CartUI extends StatelessWidget {
  const CartUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Cart List added",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

