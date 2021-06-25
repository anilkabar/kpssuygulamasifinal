import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/page/Admin/OzetEkle.dart';
import 'package:kpssuygulamasi/page/MesajlarDetay.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Admin Paneline Hoş Geldiniz"),
        ),
        body: buildListItem(context),
      ),
    );
  }
}

buildListItem(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0)),
          child: ListTile(
            title: Text("İletişim Mesajlarını Göster"),
            trailing: Icon(
              Icons.double_arrow_sharp,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MesajlarDetay()));
            },
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0)),
          child: ListTile(
            title: Text("Ozet Ekle"),
            trailing: Icon(
              Icons.double_arrow_sharp,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OzetEkle()));
            },
          ),
        ),
      ],
    ),
  );
}
