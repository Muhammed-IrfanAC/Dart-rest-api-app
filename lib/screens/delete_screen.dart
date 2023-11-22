import 'package:flutter/material.dart';

class Delete_Page extends StatelessWidget {
  const Delete_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('DELETE'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Prodct ID'
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: TextButton(onPressed: (){}, child: Text('SUBMIT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              style: TextButton.styleFrom(
                backgroundColor: Colors.purpleAccent
              ),),
            )
          ],
        ),
      ),
    );
  }
}
