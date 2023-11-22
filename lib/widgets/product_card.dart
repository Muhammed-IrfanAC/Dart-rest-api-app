import 'package:flutter/material.dart';
import 'package:rest_api/models/product_model.dart';

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
          child: IntrinsicHeight(
            child: Column(
              children: [
                Image.network(
                  product.image,
                  width: 100,
                  height: 100,
                ),
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  "${product.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )

          //),
          ),
    );
  }
}
