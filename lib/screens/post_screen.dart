import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rest_api/services/crud.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.apiUrl});

  final String apiUrl;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("Create product data"),
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
                    hintText: 'Enter the Product Title'),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product price',
                  hintText: 'Enter the Product Price',
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
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: rateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 90)),
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
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 90)),
                        labelText: 'Count of people',
                        hintText: 'Enter the count',
                      ),
                    ),
                  ),
                ],
              ),
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
                      var res = await Crud().post(
                          widget.apiUrl,
                          int.tryParse(idController.text)??0,
                          titleController.text,
                          double.tryParse(priceController.text)??0.0,
                          descController.text,
                          categoryController.text,
                          imgController.text,
                          double.tryParse(rateController.text)??0.0,
                          int.tryParse(countController.text)??0);

                      if(idController.text.isEmpty || titleController.text.isEmpty||
                          priceController.text.isEmpty||
                          descController.text.isEmpty||
                          categoryController.text.isEmpty||
                          imgController.text.isEmpty||
                          rateController.text.isEmpty||
                          countController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Empty feilds found'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      else if (res == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Request successful!'),
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
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Request failed!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                    }
                      )
                    ),
            ],
          ),
        ),
      ),
    );
  }
}


//https://fakestoreapi.com/products