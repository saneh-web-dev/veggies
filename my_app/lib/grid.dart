import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My First grid App",
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: GridApp(),
    );
  }
}

class GridApp extends StatelessWidget {
  const GridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('gird view theme'),
          backgroundColor: Colors.green,
        ),
        body: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2, //specifies the number of columns in
            children: [
              Container(color: Colors.red),
              Container(color: Colors.yellow),
              Container(color: Colors.green),
              Container(color: Colors.blue),
              Container(color: Colors.black),
              Container(color: Colors.purple),
              Container(color: Colors.indigo),
              Container(color: Colors.orange),
              Container(color: Colors.brown),
            ]));
  }
}
