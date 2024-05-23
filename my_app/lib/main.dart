import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter container',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
          // height: 300,
          // color: Colors.red,
          // margin: const EdgeInsets.all(10),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         Row(children: [
          //           InkWell(
          //             onTap: () {
          //               print('on tap button');
          //             },
          //             child: const Text('on tap inkwell button'),
          //           ),
          //         ]),
          //         const Text('s'),
          //         const Text('s'),
          //         const Text('s'),
          //         const Text('s'),
          //         TextButton(
          //             onPressed: () {
          //               print('button pressed');
          //             },
          //             child: const Text('button',
          //                 style: TextStyle(color: Colors.red))),
          //       ],
          //     ),
          //     const Text('a'),
          //     const Text('a'),
          //     const Text('a'),
          //     const Text('a'),
          //     const Text('a'),
          //     Container(
          //       height: 300,
          //       color: Colors.green,
          //     ),
          //   ],
          // ),
          child: SingleChildScrollView(
              child: Column(children: [
        Container(
            color: Colors.red,
            height: 300,
            margin: const EdgeInsets.all(3),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.yellow,
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(10),
                      ),
                      Container(
                        color: Colors.yellow,
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(10),
                      ),
                      Container(
                        color: Colors.yellow,
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(10),
                      ),
                      Container(
                        color: Colors.yellow,
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(10),
                      ),
                      Container(
                        color: Colors.yellow,
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(10),
                      ),
                      Container(
                        color: Colors.yellow,
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(10),
                      )
                    ],
                  )
                ]))),
        Container(
          color: Colors.yellow,
          height: 300,
          margin: const EdgeInsets.all(3),
        ),
        Container(
          color: Colors.blue,
          height: 300,
          margin: const EdgeInsets.all(3),
        ),
        Container(
          color: Colors.green,
          height: 300,
          margin: const EdgeInsets.all(3),
        ),
      ]))),
    );
  }
}
