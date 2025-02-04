import 'package:flutter/material.dart';

import 'SignUpScreen.dart';


class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 200,
                        height: 200,
                        image: AssetImage("images/lemonlogo.png"),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Login to LemonPie!",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    "Pies at your door!",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [

                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            filled: true,
                            fillColor: const Color.fromARGB(255, 246, 246, 246),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: const Icon(Icons.remove_red_eye_sharp),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 246, 246, 246),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 254, 204, 48),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 254, 204, 48),
                          ),
                        ),
                        const SizedBox(height: 20),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            InkWell(
                              onTap:() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Signupscreen()),
                                );
                              },
                              child: Text(
                                "Sign Up!",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 254, 204, 48),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

