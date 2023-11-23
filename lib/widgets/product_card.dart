import 'package:flutter/material.dart';
import 'package:rest_api/models/product_model.dart';
import 'package:rest_api/widgets/star_rating.dart';

class ProductCard extends StatelessWidget {
  ProductCard(this.product, {super.key});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          width: 200,
          color: Colors.white70,
          //child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.network(
                product.image,
                width: 175,
                height: 250,
              ),
              Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StarRating(product.rating.rate),
                ],
              ),
              Text(
                "out of ${product.rating.count}",
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                "\$${product.price}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )

          //),
          ),
    );
  }
}
