import 'package:flutter/material.dart';
import 'package:rest_api/services/crud.dart';

class DeletePage extends StatelessWidget {
  DeletePage({super.key, required this.apiUrl});
  final String apiUrl;

  final idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Delete Product Data'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Prodct ID'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: TextButton(
                style:
                TextButton.styleFrom(backgroundColor: Colors.purpleAccent),
                child: const Text('SUBMIT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
                  var res = await Crud().delete(apiUrl, int.tryParse(idController.text));
                  if(res == 200){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Delete successful!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
