import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sized box',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const SizedBox_Widget(),
    );
  }
}

class SizedBox_Widget extends StatelessWidget {
  const SizedBox_Widget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sized Box'),
        backgroundColor: Colors.green,
      ),
      body: SizedBox(
        child: ElevatedButton(onPressed: () {}, child: const Text('Sized Box')),
      ),
    );
  }
}
