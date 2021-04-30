import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilSayfasi extends StatelessWidget {
  final String mekanAd;
  final String gonderiResimLinki;
  final String anaResimlinki;
  final String bilgiYazi;

  const ProfilSayfasi({
    Key key,
    this.mekanAd,
    this.gonderiResimLinki,
    this.anaResimlinki,
    this.bilgiYazi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage(anaResimlinki), fit: BoxFit.cover)),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 3.0),
                      blurRadius: 5.0),
                ]),
                padding: EdgeInsets.all(15.0),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        mekanAd,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border(
                      left: BorderSide(
                        //                   <--- left side
                        color: Colors.blue[100],
                        width: 15.0,
                      ),
                      top: BorderSide(
                        //                    <--- top side
                        color: Colors.blue[300],
                        width: 10.0,
                      ),
                      right: BorderSide(
                        color: Colors.blue[500],
                        width: 8.0,
                      ),
                      bottom: BorderSide(
                        color: Colors.blue[800],
                        width: 6.0,
                      )),
                ),
                child: Text(
                  bilgiYazi,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
