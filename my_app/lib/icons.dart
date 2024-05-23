import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icons',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const IconsWidget(),
    );
  }
}

class IconsWidget extends StatelessWidget {
  const IconsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Icons Widget'), backgroundColor: Colors.green),
      body: const Center(
        child: FaIcon(FontAwesomeIcons.solidSmile),
      ),
    );
  }
}
