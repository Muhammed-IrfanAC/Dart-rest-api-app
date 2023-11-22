import 'package:flutter/material.dart';

class Put_Page extends StatefulWidget {
  const Put_Page({super.key});

  @override
  State<Put_Page> createState() => _Put_PageState();
}

class _Put_PageState extends State<Put_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("PUT"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product ID',
                  hintText: 'Enter the product ID'
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Title',
                  hintText: 'Enter the Updaeted Product Title'
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Product price',
                hintText: 'Enter the Updated Product Price',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.purpleAccent
                  ),
                  child: Text("SUBMIT", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
                  onPressed: (){
                    print("Submit clicked");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
