import 'package:flutter/material.dart';

class Hakkimizda extends StatefulWidget {
  @override
  _HakkimizdaState createState() => _HakkimizdaState();
}

class _HakkimizdaState extends State<Hakkimizda> {
  String hakkinda =
      "Bu uygulama Dr.Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen "
      "3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193311077 numaralı Nevzat Anıl KABAR tarafından 25 Haziran 2021 günü yapılmıştır";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Hakkımızda"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
              child: ListTile(
                title: Text(
                  "Bu uygulama Kpss'de Zirveyi Hedefleyenler İçin Kodlanmıştır İYİ ÇALIŞMALAR",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: Icon(
                  Icons.menu_book,
                  size: 250,
                  color: Colors.yellow,
                )),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
              child: ListTile(
                title: Text(
                  hakkinda,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
