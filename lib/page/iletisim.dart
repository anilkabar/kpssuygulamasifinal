import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kpssuygulamasi/page/DenemelerDetay.dart';
import 'package:kpssuygulamasi/page/Hakkimizda.dart';
import 'package:kpssuygulamasi/page/MesajlarDetay.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kpssuygulamasi/models/iletisimData.dart';
import 'package:kpssuygulamasi/models/db_utils.dart';

DbUtils utils = DbUtils();

class iletisim extends StatefulWidget {
  @override
  _iletisimState createState() => _iletisimState();
}

class _iletisimState extends State<iletisim> {
  TextEditingController adController = TextEditingController();
  TextEditingController epostaController = TextEditingController();
  TextEditingController telefonController = TextEditingController();
  TextEditingController mesajController = TextEditingController();

  Future<Database> database;

  List<kpssiletisim> mesajList = [];

  _onPressedAdd() async {
    final enik = kpssiletisim(
      adi: adController.text,
      eposta: epostaController.text,
      telefon: telefonController.text,
      mesaj: mesajController.text,
    );
    utils.insertiletisim(enik);
    mesajList = await utils.kpssiletisimMesaj();
    print(mesajList);
    getData();
  }

  void getData() async {
    await utils.kpssiletisimMesaj().then((result) => {
          setState(() {
            mesajList = result;
          })
        });
    print(mesajList);
  }

  List<kpssiletisim> kpssMesajlar;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mesaj Gönderme Formu"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              buildAdiniz(),
              buildeposta(),
              buildtelefon(),
              buildmesaj(),
              SizedBox(
                height: 85,
                width: 85,
              ),
              buildKaydet(),
              SizedBox(
                height: 35,
                width: 85,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAdiniz() {
    return TextFormField(
      controller: adController,
      decoration: InputDecoration(labelText: "Adınız:"),
      validator: (value) {
        return value.isEmpty ? "Bu alan Boş Geçilemez" : null;
      },
      onSaved: (String value) {
        //kpssiletisim = value;
        mesajGoster(context);
        //print("Adi:" + mesaj.adi);
      },
    );
  }

  Widget buildeposta() {
    return TextFormField(
      controller: epostaController,
      decoration: InputDecoration(labelText: "E-Posta:"),
      validator: (value) {
        return value.isEmpty ? "Bu alan Boş Geçilemez" : null;
      },
      onSaved: (String value) {
        // mesaj.eposta = value;
        //print("E Posta Adresi:" + mesaj.eposta);
      },
    );
  }

  Widget buildtelefon() {
    return TextFormField(
      controller: telefonController,
      decoration: InputDecoration(labelText: "Telefon:"),
      validator: (value) {
        return value.isEmpty ? "Bu alan Boş Geçilemez" : null;
      },
      onSaved: (String value) {
        //mesaj.telefon = value;
        //print("Telefon Numarası:" + mesaj.telefon);
      },
    );
  }

  Widget buildmesaj() {
    return TextFormField(
      controller: mesajController,
      decoration: InputDecoration(labelText: "Mesaj:"),
      validator: (value) {
        return value.isEmpty ? "Bu alan Boş Geçilemez" : null;
      },
      onSaved: (String value) {
        //mesaj.mesaj = value;

        //print("Mesajı :" + mesaj.mesaj);
      },
    );
  }

  Widget buildKaydet() {
    return SizedBox(
      width: 120,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        child: Row(
          children: <Widget>[Icon(Icons.save), Text("Kaydet")],
        ),
        onPressed: () {
          if (formkey.currentState.validate()) {
            formkey.currentState.save();
            _onPressedAdd();
          }
        },
      ),
    );
  }

/*
  Widget buildKaydet() {
    return SizedBox(
      width: 120,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            ElevatedButton(onPressed: _onPressedAdd, child: Text("Insert Dog")),
      ),
    );
  }
*/

  void mesajGoster(BuildContext context) {
    var alert = AlertDialog(
        title: Text("Başarılı"),
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                //Text("Sn:" + veri),
                Text("Mesajınız İçin Teşekkürler"),
              ],
            ),
          ),
        ));
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
