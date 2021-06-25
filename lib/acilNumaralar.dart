import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class acilNo extends StatelessWidget {
  final String title = 'Url Launcher';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Acil Numaralar"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 32.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://qha.com.tr/wp-content/uploads/2020/04/94371407_911659792620458_1493843600402808832_n.jpg"),
                        fit: BoxFit.fill)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            "Polis",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(width: 13),
                        buildButton(
                          text: '155',
                          onClicked: () =>
                              Utils.openPhoneCall(phoneNumber: '155'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            "Ambulans",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      buildButton(
                        text: '112',
                        onClicked: () =>
                            Utils.openPhoneCall(phoneNumber: '112'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            "İtfaiye",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      buildButton(
                        text: '110',
                        onClicked: () =>
                            Utils.openPhoneCall(phoneNumber: '110'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildButton({
    @required String text,
    @required VoidCallback onClicked,
  }) =>
      Container(
        // ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: onClicked,
          color: Colors.blue,
          textColor: Colors.white,
          child: Row(
            children: [
              Icon(
                Icons.call,
                color: Colors.white,
                size: 20.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
}

class Utils {
  static Future openLink({
    @required String url,
  }) =>
      _launchUrl(url);

  static Future openEmail({
    @required String toEmail,
    @required String subject,
    @required String body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    await _launchUrl(url);
  }

  static Future openPhoneCall({@required String phoneNumber}) async {
    final url = 'tel:$phoneNumber';

    await _launchUrl(url);
  }

  static Future openSMS({@required String phoneNumber}) async {
    final url = 'sms:$phoneNumber';

    await _launchUrl(url);
  }

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
