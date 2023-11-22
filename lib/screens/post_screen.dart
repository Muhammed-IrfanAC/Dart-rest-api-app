import 'package:flutter/material.dart';

class Post_Page extends StatefulWidget {
  const Post_Page({super.key});

  @override
  State<Post_Page> createState() => _Post_PageState();
}

class _Post_PageState extends State<Post_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("POST"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product ID',
                  hintText: 'Enter the product ID'),
            ),
            SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Title',
                  hintText: 'Enter the Product Title'),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Product price',
                hintText: 'Enter the Product Price',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.purpleAccent),
                  child: Text("SUBMIT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20)),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
