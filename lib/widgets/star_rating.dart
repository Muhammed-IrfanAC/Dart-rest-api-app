import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  StarRating(this.rating, {super.key});

  double rating;
  int maxRating = 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(maxRating, (index) {
          if (index < rating) {
            if (rating - index < 1)
              return Icon(Icons.star_half, color: Colors.orange, size: 20);
            else
              return Icon(Icons.star, color: Colors.orange, size: 20);
          } else
            return Icon(Icons.star_border, size: 20);
        })
      ],
    );
  }
}
