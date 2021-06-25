import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juxtapose/juxtapose.dart';

class ProfilSayfasi extends StatefulWidget {
  final String mekanAd;
  final String gonderiResimLinki;
  final String anaResimlinki;
  final String bilgiYazi;

  ProfilSayfasi({
    this.mekanAd,
    this.gonderiResimLinki,
    this.anaResimlinki,
    this.bilgiYazi,
  });

  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  final _firestore = FirebaseFirestore.instance;

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
                child: Juxtapose(
                  dividerThickness: 3.0,
                  thumbSize: Size(16, 16),
                  backgroundColor: Color(0xFF012747),
                  foregroundWidget: FittedBox(
                    fit: BoxFit.fill,
                    child: Image(
                      image: NetworkImage(widget.anaResimlinki),
                    ),
                  ),
                  backgroundWidget: FittedBox(
                    fit: BoxFit.fill,
                    child: Image(
                      image: NetworkImage(widget.gonderiResimLinki),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
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
                        widget.mekanAd,
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
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('deneme')
                      .doc(widget.bilgiYazi)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var userDocument = snapshot.data;
                    return Text(
                      userDocument["bilgi"],
                      style: TextStyle(fontSize: 20.0),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
