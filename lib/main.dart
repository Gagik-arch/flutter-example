import 'package:flutter/material.dart';
import './api/posts.dart';
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
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 2;

  void asd() {
    setState(() => counter *= 2);
    postApi.getPosts();
    // print('$counter === asd');
  }

  @override
  void initState() {
    super.initState();
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
              children: <Widget>[
                Container(
                    width: 200,
                    height: 200,
                    color: const Color.fromRGBO(0, 150, 50, 1)),
              ]),
          Accordeon(
              id: '2',
              title: const Text('title2'),
              isExpanded: false,
              children: <Widget>[
                Accordeon(
                    id: '3',
                    title: const Text('title3'),
                    isExpanded: false,
                    children: <Widget>[
                      Accordeon(
                        id: '4',
                        title: const Text('title5'),
                        isExpanded: false,
                        children: const <Widget>[Text('asdsd')],
                      ),
                    ]),
              ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: asd,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
