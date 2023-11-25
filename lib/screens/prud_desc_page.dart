import 'package:flutter/material.dart';

import '../widgets/star_rating.dart';

class ProdDescPage extends StatelessWidget {
  ProdDescPage(
      this.title, this.image, this.price, this.description, this.rating,
      {super.key});

  String title, description, image;
  double price, rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},

        isExtended: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        label: const Text('Buy Now'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.network(image),
              const SizedBox(
                height: 10,
              ),
              Text(
                this.title,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              StarRating(rating),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "\$$price",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(description),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
