import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "stack",
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('stack'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Container(width: 200, height: 200, color: Colors.red),
          Container(width: 180, height: 180, color: Colors.green)
        ],
      ),
    );
  }
}
