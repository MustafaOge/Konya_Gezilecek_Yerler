import 'package:flutter/material.dart';
import 'package:konya_gezilecek_yerler/bilgiSayfasi.dart';

import 'bilgiSayfasi.dart';

class GonderiKarti extends StatelessWidget {
  final String anaResim;
  final String bilgiYazi;
  final String gonderiResimLinki;
  final String mekan;

  const GonderiKarti(
      {Key key,
      this.anaResim,
      this.bilgiYazi,
      this.gonderiResimLinki,
      this.mekan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        child: InkWell(
          onTap: () async {
            bool donenVeri = await Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ProfilSayfasi(
                      anaResimlinki: anaResim,
                      mekanAd: mekan,
                      gonderiResimLinki: gonderiResimLinki,
                      bilgiYazi: bilgiYazi,
                    )));
          },
          child: Container(
            padding: EdgeInsets.all(15.0),
            width: double.infinity,
            height: 328.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 3.0),
                      blurRadius: 5.0),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[],
                        ),
                      ],
                    ),
                  ],
                ),
                Text(mekan,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      height: 2.0,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Image.network(
                  gonderiResimLinki,
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 4.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
