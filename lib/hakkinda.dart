import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'uygHakkinda.dart';
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
    return UygHakkinda();
  }
}
