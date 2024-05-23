import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ignore: prefer_typing_uninitialized_variables
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my app',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var names = [
      'sourabh',
      'vishal',
      'rajendra',
      'monu',
      'jaiwardhan',
      'gautam',
      'sunny'
    ];
    return Scaffold(
        appBar: AppBar(
            // backgroundColor: const Color.fromARGB(255, 229, 187, 184),
            ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
                leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/img.png')),
                title: Text(names[index],
                    style: const TextStyle(
                      fontFamily: 'sans',
                    )),
                subtitle: const Text('Number'),
                trailing: const Icon(Icons.add));
          },
          itemCount: names.length,
          separatorBuilder: (context, index) =>
              const Divider(height: 100, thickness: 1),
        ));
  }
}
