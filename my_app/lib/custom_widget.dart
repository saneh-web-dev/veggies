import 'package:flutter/material.dart';
import 'package:my_app/custom_widgets/round_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basics',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('basics in flutter'),
        backgroundColor: Colors.green,
      ),
      body: const RoundedButton(
          btnName: 'click me', bgColor: Colors.red, buttonText: "Clicked"),
    );
  }
}
