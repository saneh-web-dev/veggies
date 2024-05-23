import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wrap widget',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const WrapWidget(),
    );
  }
}

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('wrap widget'), backgroundColor: Colors.green),
      body: Wrap(
        spacing: 11,
        runSpacing: 11,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          Container(width: 100, height: 100, color: Colors.red),
          Container(width: 100, height: 100, color: Colors.blue),
          Container(width: 100, height: 100, color: Colors.yellow),
          Container(width: 100, height: 100, color: Colors.brown),
          Container(width: 100, height: 100, color: Colors.purple),
          Container(width: 100, height: 100, color: Colors.indigo),
          Container(width: 100, height: 100, color: Colors.grey),
          Container(width: 100, height: 100, color: Colors.pink),
          Container(width: 100, height: 100, color: Colors.black),
        ],
      ),
    );
  }
}
