import 'package:flutter/material.dart';
import '../Model/Product.dart';
import 'dart:core';
import '../Widgets/myClipper.dart';
import '../Widgets/reviewWidget.dart';
import '../Widgets/roundButton.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.productName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 50),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _isAdded
                              ? Colors.red
                              : Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isAdded
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: Colors.white,
                          size: 22,
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
                const SizedBox(height: 30),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('1'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                    const Spacer(),
                    Text(
                      '${widget.product.currency}${widget.product.price % 1 == 0 ? widget.product.price.toInt() : widget.product.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Product Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(fontSize: 16),
                ),
                const Divider(thickness: 1, height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Reviews",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ReviewsWidget(rating: widget.product.rating),
                  ],
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: RoundButton(title: "Add To Cart"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

