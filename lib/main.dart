import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Read Local JSON'),
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
  //
  //
  //

  List<ListTile> t01 = [];
  List<ListTile> t02 = [];
  //
  Future<void> testJson() async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString("source/myJson.json");
    setState(() {
      Map<String, dynamic> data = jsonDecode(jsonString);
      data.forEach((key, value) {
        MyJsonClassItem myTestClass = MyJsonClassItem.fromJson(value);
        t01.add(ListTile(title: Text(myTestClass.t01)));
        t02.add(ListTile(title: Text(myTestClass.t02)));
      });
    });
  }
  //
  //
  //

  @override
  void initState() {
    testJson();
  }
  //
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(children: t01),
      ),
    );
  }
}

class MyJsonClassItem {
  final t01;
  final t02;

  MyJsonClassItem(this.t01, this.t02);

  MyJsonClassItem.fromJson(Map<String, dynamic> json)
      : t01 = json["test01"],
        t02 = json["test02"];
}
