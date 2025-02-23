
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewsWidget extends StatelessWidget {
  final double rating;
  final double starSize;

  const ReviewsWidget({
    Key? key,
    required this.rating,
    this.starSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        double fillAmount = rating - index;
        return Icon(
          fillAmount >= 1
              ? Icons.star
              : fillAmount >= 0.5
              ? Icons.star_half
              : Icons.star_border,
          color: Colors.amber,
          size: starSize,
        );
      }),
    );
  }
}
