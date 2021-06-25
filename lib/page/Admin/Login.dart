import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/main.dart';
import 'package:kpssuygulamasi/page/Admin/Admin.dart';
import 'package:kpssuygulamasi/page/iletisim.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController kadiController = TextEditingController();
  TextEditingController sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Paneli Giriş"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: <Widget>[
              buildKadi(),
              buildSifre(),
              SizedBox(
                height: 35,
                width: 45,
              ),
              buildKaydet(),
              SizedBox(
                height: 35,
                width: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildKadi() {
    return TextFormField(
      controller: kadiController,
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

  Widget buildSifre() {
    return TextFormField(
      controller: sifreController,
      decoration: InputDecoration(labelText: "Şifre:"),
      validator: (value) {
        return value.isEmpty ? "Bu alan Boş Geçilemez" : null;
      },
      onSaved: (String value) {
        // mesaj.eposta = value;
        //print("E Posta Adresi:" + mesaj.eposta);
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
          children: <Widget>[Icon(Icons.save), Text("Giriş Yap")],
        ),
        onPressed: () {
          print(kadiController.text);
          if (kadiController.text == "admin" &&
              sifreController.text == "admin") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Admin()));
          } else {
            mesajGoster(context);
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
                Text("Kullanıcı Adı veya Parola Hatalı"),
              ],
            ),
          ),
        ));
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
