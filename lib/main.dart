import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konya_gezilecek_yerler/bilgi.dart';
import 'package:konya_gezilecek_yerler/gonderikarti.dart';

import 'hakkinda.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.autorenew,
            color: Colors.blueGrey,
            size: 32.0,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Konya Gezilecek Yerler",
          style: TextStyle(fontSize: 20.0, color: Colors.blueGrey[700]),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_sharp,
              color: Colors.blueGrey,
              size: 32.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => info()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5.0),
            ]),
          ),
          SizedBox(
            height: 10.0,
          ),
          GonderiKarti(
            bilgiYazi: Mevlana,
            mekan: "Mevlana türbesi",
            anaResim: "https://d.pusulahaber.com.tr/news/268262.jpg",
            gonderiResimLinki:
                "https://im.haberturk.com/yerel_haber/2020/06/15/ver1592216700/78711706_620x410.jpg",
          ),
          GonderiKarti(
            bilgiYazi: ecdat,
            mekan: "Ecdat Parkı",
            anaResim:
                "https://www.konya.bel.tr/bldfoto/17/prk/ecdat_bahcesi_b_1.jpg",
            gonderiResimLinki:
                "https://live.staticflickr.com/4866/31420110197_ea54466665_b.jpg",
          ),
          GonderiKarti(
            bilgiYazi: japon,
            mekan: "Kyoto japon parkı",
            anaResim:
                "https://www.gezivetatilrehberi.com/resimler/sehir/konya/gezi/konya-kyoto-japon-parki-1613048353.jpg",
            gonderiResimLinki:
                "https://gezicini.com/wp-content/uploads/2020/10/japon-1.jpg",
          ),
          GonderiKarti(
            bilgiYazi: kelebek,
            mekan: "Konya Tropikal Kelebek Bahçesi",
            anaResim:
                "https://www.aa.com.tr/uploads/userFiles/f8244181-67c8-4d85-98fc-b252d1f7e0ec/2020%2FEYLUL%2F06%2Fkonya%2F20200906_2_44220771_57938555.jpg",
            gonderiResimLinki:
                "https://www.selcuklu.bel.tr/images_upload/ilcemizmenu/original/1477900609.jpg",
          ),
          GonderiKarti(
            bilgiYazi: panorama,
            mekan: "Panorama Konya müzesi",
            anaResim:
                "https://www.pusulahaber.com.tr/d/other/20180105_160325.jpg",
            gonderiResimLinki:
                "https://media-cdn.tripadvisor.com/media/photo-m/1280/13/d0/ab/f6/konyanuma-panorama.jpg",
          ),
          GonderiKarti(
            bilgiYazi: meram,
            mekan: "Meram Bağları",
            anaResim:
                "https://live.staticflickr.com/2863/9044364510_acbf331e68_b.jpg",
            gonderiResimLinki:
                "https://media-cdn.tripadvisor.com/media/photo-s/17/2a/6e/ba/meram-baglari.jpg",
          ),
          GonderiKarti(
            bilgiYazi: tepe,
            mekan: "Konya Alâeddin Tepesi",
            anaResim:
                "https://www.selcuklucocuk.com/images/Upload/blogimages/a14d640b_a366_4be8_9fe1_c7e5aece439f.jpg",
            gonderiResimLinki:
                "https://staticb.yolcu360.com/blog/wp-content/uploads/2018/05/28202718/Konya-Alaaddin-Tepesi-2.jpg",
          ),
        ],
      ),
    );
  }
}
