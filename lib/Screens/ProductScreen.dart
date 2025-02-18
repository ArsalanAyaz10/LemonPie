import 'package:flutter/material.dart';
import '../Model/Product.dart';
import 'dart:math';
import 'dart:core';

class ProductScreen extends StatefulWidget {
  final Product product;

   ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productName),
        centerTitle: true,
        backgroundColor: WidgetStateColor.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                Stack(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.product.imageUrl),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.product.productName,textAlign: TextAlign.left,style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 50),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: _isAdded
                              ? const Color.fromARGB(255, 245, 30, 15)
                              : Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isAdded
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _isAdded = !_isAdded;
                        });
                      },
                    ),
                  ],
                ),
                const Text("1 Pound",style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

