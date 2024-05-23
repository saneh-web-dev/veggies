import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Callback functions',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const Callback_Fn(),
    );
  }
}

class Callback_Fn extends StatelessWidget {
  const Callback_Fn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(children: [
          Row(children: [
            CircleAvatar(backgroundImage: AssetImage('assets/images/img.png')),
            Text('world')
          ])
        ]),
        backgroundColor: Colors.green,
      ),
      body: ElevatedButton(
          onPressed: () {
            print('clicked');
          },
          child: const Text('click me')),
    );
  }
}
