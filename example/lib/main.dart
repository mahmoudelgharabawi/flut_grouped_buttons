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
      home: const MyHomePage(title: 'flut_grouped_buttons'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Check Box Example',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutGroupedButtons<String>(
                      data: const [
                        "Saturday",
                        "Sunday",
                        "Monday",
                        "Tuesday",
                        "Wednesday",
                        "Thursday",
                        "Friday",
                      ],
                      onChanged: (value) => print(value),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: FlutGroupedButtons<Map<String, String>>(
                  //     idKey: 'id',
                  //     valueKey: 'name',
                  //     data: const [
                  //       {"id": 'id1', "name": "Saturday"},
                  //       {"id": 'id2', "name": "Sunday"},
                  //       {"id": 'id3', "name": "Monday"},
                  //       {"id": 'id4', "name": "Tuesday"},
                  //       {"id": 'id5', "name": "Wednesday"},
                  //       {"id": 'id6', "name": "Thursday"},
                  //       {"id": 'id7', "name": "Friday"},
                  //     ],
                  //     onChanged: (id) => print(id),
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Radio Button Example',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutGroupedButtons<String>(
                      isRadio: true,
                      data: const [
                        "Saturday",
                        "Sunday",
                        "Monday",
                        "Tuesday",
                        "Wednesday",
                        "Thursday",
                        "Friday",
                      ],
                      onChanged: (value) => print(value),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: FlutGroupedButtons<Map<String, String>>(
                  //     isRadio: true,
                  //     idKey: 'id',
                  //     valueKey: 'name',
                  //     data: const [
                  //       {"id": 'id1', "name": "Saturday"},
                  //       {"id": 'id2', "name": "Sunday"},
                  //       {"id": 'id3', "name": "Monday"},
                  //       {"id": 'id4', "name": "Tuesday"},
                  //       {"id": 'id5', "name": "Wednesday"},
                  //       {"id": 'id6', "name": "Thursday"},
                  //       {"id": 'id7', "name": "Friday"},
                  //     ],
                  //     onChanged: (value) => print(value),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
