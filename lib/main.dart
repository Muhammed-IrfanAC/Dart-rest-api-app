import 'package:animated_splash_screen/animated_splash_screen.dart';
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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(
          duration: 1500,
            splash: Image.network("https://fakestoreapi.com/icons/logo.png"),
            nextScreen: const MyHomePage(title: 'Fake Store API')));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String apiUrl = "https://fakestoreapi.com/products";

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
            Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(apiUrl, style: const TextStyle(fontSize: 20)))),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Text(
                    'FETCH',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetPage(apiUrl: apiUrl)));
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Text(
                    'CREATE',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostPage(apiUrl: apiUrl)));
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: const Text(
                    'UPDATE',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PutPage(apiUrl: apiUrl)));
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
                            builder: (context) => DeletePage(apiUrl: apiUrl)));
                  }),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
