import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lemonpieui/Screens/HomeScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class Emailverifyscreen extends StatefulWidget {
  const Emailverifyscreen({super.key});

  @override
  State<Emailverifyscreen> createState() => _EmailverifyscreenState();
}

class _EmailverifyscreenState extends State<Emailverifyscreen> {
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Verify your Email below!",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const Homescreen()),
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
                              child: const Text(
                                "VERIFY EMAIL",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Our Socials!",
                              style: TextStyle(
                                color: Color.fromARGB(255, 254, 204, 48),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                child: const Icon(
                              FontAwesomeIcons.linkedin,
                              color: Colors.blueAccent,
                              size: 40,
                            ),
                              onTap: () async {
                                final Uri url = Uri.parse("https://www.linkedin.com/in/arsalan-ayaz-a35a9428a/?originalSubdomain=pk");
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url, mode: LaunchMode.externalApplication);
                                } else {
                                  debugPrint("Could not launch $url");
                                }
                              },

                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.pink,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.email_sharp,
                              color: Colors.red,
                              size: 40,
                            ),
                          ],
                        )
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
