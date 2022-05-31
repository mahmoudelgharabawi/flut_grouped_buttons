import 'package:flut_grouped_buttons/flut_grouped_buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          FlutGroupedButtons<Map<String, String>>(
            idKey: 'id',
            valueKey: 'value',
            titleCheckSpace: 0,
            isRadio: true,
            isRow: true,
            data: [
              {'id': '15', 'value': '15 دقائق'},
              {'id': '30', 'value': '30 دقائق'},
              {'id': '45', 'value': '45 دقائق'},
              {'id': '60', 'value': '1 ساعة'},
              {'id': '120', 'value': '2 ساعة'},
              {'id': '180', 'value': '3 ساعة'},
            ],
            onChanged: (value) {
              print(value);
            },
          ),
          FlutGroupedButtons<Map<String, String>>(
            idKey: 'idex',
            valueKey: 'result',
            titleCheckSpace: 0,
            isRadio: true,
            isRow: true,
            data: [
              {'idex': '15', 'result': '15 دقائق'},
              {'idex': '30', 'result': '30 دقائق'},
              {'idex': '45', 'result': '45 دقائق'},
              {'idex': '60', 'result': '1 ساعة'},
              {'idex': '120', 'result': '2 ساعة'},
              {'idex': '180', 'result': '3 ساعة'},
            ],
            onChanged: (value) {
              print(value);
            },
          ),
          FlutGroupedButtons<String>(
            titleCheckSpace: 0,
            isRadio: true,
            // isRow: true,
            data: const [
              'test',
              'test2',
              'test3',
              'test4',
            ],
            onChanged: (value) {
              print(value);
            },
          ),
        ],
      ),
    );
  }
}
