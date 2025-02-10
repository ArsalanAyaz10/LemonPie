import 'package:flutter/material.dart';
import 'package:flutter_cart/cart.dart';
import '/Screens/loginScreen.dart';
import '/Screens/SignUpScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var cart = FlutterCart();
  await cart.initializeCart(isPersistenceSupportEnabled: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: BuildUI(),
      ),
    );
  }
}

class BuildUI extends StatelessWidget {
  const BuildUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      width: 200,
                      height: 200,
                      image: AssetImage("images/lemonlogo.png"),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome to LemonPie!",
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                "Your favorite bakery, just a tap away! 🍋🥧",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const Text(
                "Freshly baked pies delivered to your doorstep!",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    InkWell(
                      onTap:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Loginscreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 254, 204, 48),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    InkWell(
                      onTap:() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signupscreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 254, 204, 48),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
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
