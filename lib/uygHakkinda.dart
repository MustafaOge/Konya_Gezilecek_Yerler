import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'loadData.dart';

Future<LoadData> apiCall() async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

var url = Uri.parse("https://api.npoint.io/8fcec02f4c68c806ae2e");

class UygHakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Json API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uygulama Hakkında"),
        backgroundColor: Colors.teal[600],
        centerTitle: true,
      ),
      body: FutureBuilder<LoadData>(
        future: apiCall(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Center(
                      child: Text(
                "${snapshot.data.username} \n",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ))),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
