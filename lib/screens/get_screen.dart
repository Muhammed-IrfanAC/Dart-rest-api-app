import 'package:flutter/material.dart';
import 'package:rest_api/models/product_model.dart';
import 'package:rest_api/screens/prud_desc_page.dart';
import 'package:rest_api/services/crud.dart';
import 'package:rest_api/widgets/product_card.dart';

class GetPage extends StatefulWidget {
  GetPage({super.key, required this.apiUrl});

  String apiUrl;

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  late Future<List<ProductModel>> productData;


  @override
  void initState() {
    super.initState();
    productData = Crud().get(widget.apiUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .inversePrimary,
            title: const Text("GET")),
        body: FutureBuilder<List<ProductModel>>(
            future: productData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var productData = snapshot.data;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.45,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: productData!.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: ProductCard(productData[index])),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                ProdDescPage(
                                    productData[index].title,
                                    productData[index].image,
                                    productData[index].price,
                                    productData[index].description,
                                    productData[index].rating.rate)));
                      },
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
