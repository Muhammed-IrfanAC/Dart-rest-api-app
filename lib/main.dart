import 'package:flutter/material.dart';
import 'package:rest_api/screens/delete_screen.dart';
import 'package:rest_api/screens/post_screen.dart';
import 'package:rest_api/screens/put_screen.dart';
import 'screens/get_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'REST API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final apiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            TextField(
                controller: apiController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "API address goes here",
                )),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Text(
                    'GET',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetPage(
                                apiUrl: apiController.text.toString())));
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Text(
                    'POST',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostPage(
                              apiUrl: apiController.text,
                            )));
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Text(
                    'PUT',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PutPage(apiUrl: apiController.text)));
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Text(
                    'DELETE',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Delete_Page()));
                  }),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
