import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bilgi.dart';

class info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: infoEkran(),
    );
  }
}

class infoEkran extends StatefulWidget {
  @override
  InfoEkran createState() => InfoEkran();
}

class InfoEkran extends State<infoEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Hakkında"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0),
              ]),
              padding: EdgeInsets.all(15.0),
              width: double.infinity,
              height: 230.0,
              child: Text(
                hakkinda,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
