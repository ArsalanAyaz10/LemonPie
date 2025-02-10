import 'package:flutter/material.dart';
import 'package:lemonpieui/Screens/emailVerifyScreen.dart';

import 'SignUpScreen.dart';


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  bool _viewPassword = false;

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
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.remove_red_eye_sharp),
                              onPressed: (){
                                setState(() {
                                  _viewPassword = true;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 246, 246, 246),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          obscureText: _viewPassword,
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Emailverifyscreen()),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 254, 204, 48),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:  const Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Emailverifyscreen()),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 254, 204, 48),
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
        ),
      ),
    );
  }
}

