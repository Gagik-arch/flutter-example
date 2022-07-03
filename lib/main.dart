import 'package:flutter/material.dart';
import './requests/posts.dart';
import './core/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // postApi.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          Accordeon(
            title: const Text('title'),
            isExpanded: false,
            id: '1',
            child: Container(
                width: 200,
                height: 200,
                color: const Color.fromRGBO(0, 150, 50, 1)),
          ),
          Accordeon(
            id: '2',
            title: const Text('title2'),
            isExpanded: true,
            child: Accordeon(
              id: '3',
              title: const Text('title5'),
              isExpanded: true,
              child: Accordeon(
                id: '4',
                title: const Text('title5'),
                isExpanded: true,
                child: const Text('asdsd'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

List data = [
  {
    'title': 'asd',
    'subTitle': 'asddgg',
  },
  {
    'title': '2132',
    'subTitle': 'asdasdasd',
  }
];
