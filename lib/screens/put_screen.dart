import 'package:flutter/material.dart';

import '../services/crud.dart';

class PutPage extends StatefulWidget {
  const PutPage({super.key, required this.apiUrl});
  final String apiUrl;

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final categoryController = TextEditingController();
  final imgController = TextEditingController();
  final rateController = TextEditingController();
  final countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Update Product Data"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product ID',
                    hintText: 'Enter the product ID'),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product Title',
                    hintText: 'Enter the Updaeted Product Title'),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product price',
                  hintText: 'Enter the Updated Product Price',
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: descController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product description',
                  hintText: 'Enter the Product description',
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Category',
                  hintText: 'Enter the Product Category',
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: imgController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Image URL',
                  hintText: 'Enter the Image URL',
                ),
              ),
              const SizedBox(height: 5),
              Row(children: [
                Flexible(
                  child: TextField(
                    controller: rateController,
                    decoration: const InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 90)),
                      labelText: 'Product rating',
                      hintText: 'Enter the Product rating',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: TextField(
                    controller: countController,
                    decoration: const InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 90)),
                      labelText: 'Count of people',
                      hintText: 'Enter the count',
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.purpleAccent),
                    child: const Text("SUBMIT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20)),
                    onPressed: () async {
                      if (idController.text.isEmpty){
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid ID!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      var res = await Crud().patch(
                        widget.apiUrl,
                        int.tryParse(idController.text),
                        titleController.text.isNotEmpty ? titleController.text : null,
                        priceController.text.isNotEmpty ? double.parse(priceController.text) : null,
                        descController.text.isNotEmpty ? descController.text : null,
                        categoryController.text.isNotEmpty ? categoryController.text : null,
                        imgController.text.isNotEmpty ? imgController.text : null,
                        rateController.text.isNotEmpty ? double.parse(rateController.text) : null,
                        countController.text.isNotEmpty ? int.parse(countController.text) : null,
                      );

                      if (res == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Update successful!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        FocusScope.of(context).unfocus();
                        setState(() {
                          idController.clear();
                          titleController.clear();
                          priceController.clear();
                          descController.clear();
                          categoryController.clear();
                          imgController.clear();
                          rateController.clear();
                          countController.clear();
                        });
                      }

                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
