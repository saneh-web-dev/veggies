// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'input text',
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class InputPage extends StatelessWidget {
  InputPage({super.key});
  var email = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('input filed'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "email",
                    border: OutlineInputBorder(),
                  ),
                ),
                Container(height: 11),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'password',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.yellow,
                    )),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye, color: Colors.green),
                      onPressed: null, // TODO: implement on pressed function
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String mail = email.text.toString();
                    String pasword = password.text;
                    print("email: $mail Password: $pasword");
                  },
                  child: const Text('login'),
                ),
              ],
            ),
          ),
        ));
  }
}
