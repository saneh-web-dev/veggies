import 'package:flutter/material.dart';

void main() {
  runApp(const CardWidget());
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home page',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Card(
        elevation: 10,
        shadowColor: Colors.red,
        color: Colors.green,
        child: Padding(
            padding: EdgeInsets.all(3),
            child: Text('hello', style: TextStyle(fontSize: 30))),
      ),
    );
  }
}
