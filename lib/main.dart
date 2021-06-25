import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konya_gezilecek_yerler/acilNumaralar.dart';
import 'package:konya_gezilecek_yerler/gonderikarti.dart';

import 'hakkinda.dart';
import 'konya.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal[600],
        elevation: 0.0,
        title: Text(
          "Konya Gezilecek Yerler",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            fontFamily: 'Courgette',
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_sharp,
              color: Colors.white,
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
      drawer: Drawer(
        //  çekmece
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red[400],
                image: DecorationImage(
                    image: NetworkImage(
                      "https://media.istockphoto"
                      ".com/photos/konya-city-in-turkey-picture-id862246584?k"
                      "=6&m=862246584&s=612x612&w=0&h=gBlewKcGwDSnOhi1Lp1V5tk"
                      "VAUVl980X3r23YGSBdAw=",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Card(
              shadowColor: Colors.blue,
              child: ListTile(
                title: Text(
                  "Konya Hakkında",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LineChartSample2()),
                  );
                },
              ),
            ),
            Card(
              shadowColor: Colors.blue,
              child: ListTile(
                title: Text(
                  "Acil Numaralar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => acilNo()));
                },
              ),
            ),
            Card(
              shadowColor: Colors.blue,
              child: ListTile(
                title: Text(
                  "Çıkış YAP",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        // Columndan farklı olarak aşağı yöne kaydırma özelliği vardır
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
            bilgiYazi: 'Mevlana',
            mekan: "Mevlana türbesi",
            anaResim: "https://d.pusulahaber.com.tr/news/268262.jpg",
            gonderiResimLinki:
                "https://im.haberturk.com/yerel_haber/2020/06/15/ver1592216700/78711706_620x410.jpg",
          ),
          GonderiKarti(
            bilgiYazi: 'ecdat',
            mekan: "Ecdat Parkı",
            anaResim:
                "https://www.konya.bel.tr/bldfoto/17/prk/ecdat_bahcesi_b_1.jpg",
            gonderiResimLinki:
                "https://live.staticflickr.com/4866/31420110197_ea54466665_b.jpg",
          ),
          GonderiKarti(
            bilgiYazi: "sille",
            mekan: "Sille Barajı",
            anaResim: "http://www.selcuklu.gov.tr/kurumlar/selcuklu.gov"
                ".tr/ilcemiz/sillebaraji04.jpg",
            gonderiResimLinki:
                "http://www.selcuklu.gov.tr/kurumlar/selcuklu.gov"
                ".tr/ilcemiz/sillebaraji03.jpg",
          ),
          GonderiKarti(
            bilgiYazi: 'japon',
            mekan: "Kyoto japon parkı",
            anaResim:
                "https://www.gezivetatilrehberi.com/resimler/sehir/konya/gezi/konya-kyoto-japon-parki-1613048353.jpg",
            gonderiResimLinki:
                "https://gezicini.com/wp-content/uploads/2020/10/japon-1.jpg",
          ),
          GonderiKarti(
            bilgiYazi: 'kelebek',
            mekan: "Konya Tropikal Kelebek Bahçesi",
            anaResim:
                "https://www.aa.com.tr/uploads/userFiles/f8244181-67c8-4d85-98fc-b252d1f7e0ec/2020%2FEYLUL%2F06%2Fkonya%2F20200906_2_44220771_57938555.jpg",
            gonderiResimLinki:
                "https://www.selcuklu.bel.tr/images_upload/ilcemizmenu/original/1477900609.jpg",
          ),
          GonderiKarti(
            bilgiYazi: 'panorama',
            mekan: "Panorama Konya müzesi",
            anaResim:
                "https://www.pusulahaber.com.tr/d/other/20180105_160325.jpg",
            gonderiResimLinki:
                "https://media-cdn.tripadvisor.com/media/photo-m/1280/13/d0/ab/f6/konyanuma-panorama.jpg",
          ),
          GonderiKarti(
            bilgiYazi: 'meram',
            mekan: "Meram Bağları",
            anaResim:
                "https://live.staticflickr.com/2863/9044364510_acbf331e68_b.jpg",
            gonderiResimLinki: "https://media-cdn.tripadvisor"
                ".com/media/photo-s/17/2a/6e/ba/meram-baglari.jpg",
          ),
          GonderiKarti(
            bilgiYazi: 'tepe',
            mekan: "Konya Alâeddin Tepesi",
            anaResim:
                "https://www.selcuklucocuk.com/images/Upload/blogimages/a14d640b_a366_4be8_9fe1_c7e5aece439f.jpg",
            gonderiResimLinki:
                "https://staticb.yolcu360.com/blog/wp-content/uploads/2018/05/28202718/Konya-Alaaddin-Tepesi-2.jpg",
          ),
          GonderiKarti(
            bilgiYazi: "zazadin",
            mekan: "Zazadin Hanı",
            anaResim: "http://www.selcuklu.gov.tr/kurumlar/selcuklu.gov"
                ".tr/ilcemiz/zazadin4.jpg",
            gonderiResimLinki:
                "http://www.selcuklu.gov.tr/kurumlar/selcuklu.gov"
                ".tr/ilcemiz/zazadin5.jpg",
          ),
        ],
      ),
    );
  }
}
