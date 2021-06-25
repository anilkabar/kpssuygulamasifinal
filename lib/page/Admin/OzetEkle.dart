import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/models/OzetlerData.dart';
import 'package:kpssuygulamasi/providers/kpssOzetler_provider.dart';
import 'package:provider/provider.dart';

class OzetEkle extends StatefulWidget {
  final kpssOzetler kpssozet;

  OzetEkle([this.kpssozet]);

  @override
  _EditDomainFirmsViewState createState() => _EditDomainFirmsViewState();
}

class _EditDomainFirmsViewState extends State<OzetEkle> {
  final adiController = TextEditingController();
  final icerikController = TextEditingController();
  final dersAdiController = TextEditingController();

  @override
  void dispose() {
    adiController.dispose();
    icerikController.dispose();
    dersAdiController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //New Record
    adiController.text = "";
    icerikController.text = "";
    dersAdiController.text = "";
    new Future.delayed(Duration.zero, () {
      final kpssOzetlerEkle =
          Provider.of<kpssOzetlerProvider>(context, listen: false);
      kpssOzetlerEkle.loadValues(kpssOzetler());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kpssOzetlerProv = Provider.of<kpssOzetlerProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Ozet Ekleme Sayfası')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: adiController,
              decoration: InputDecoration(hintText: 'Özet Adı'),
              onChanged: (value) {
                kpssOzetlerProv.changeAdi(value);
              },
            ),
            TextField(
              controller: icerikController,
              decoration: InputDecoration(hintText: 'Özet İçeriği'),
              onChanged: (value) {
                kpssOzetlerProv.changeIcerik(value);
              },
            ),
            TextField(
              controller: dersAdiController,
              decoration: InputDecoration(hintText: 'Dersin Adi'),
              onChanged: (value) {
                kpssOzetlerProv.changeDersAdi(value);
              },
            ),
            SizedBox(
              height: 20.0,
              width: 2,
            ),
            SizedBox(
              width: 120,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                child: Row(
                  children: <Widget>[Icon(Icons.save), Text("Kaydet")],
                ),
                onPressed: () {
                  kpssOzetlerProv.saveProduct();
                  Navigator.of(context).pop();
                  mesajGoster(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
              Text("Ozet Ekleme İşlemi Başarı İle Tamamlandı"),
            ],
          ),
        ),
      ));
  showDialog(context: context, builder: (BuildContext context) => alert);
}
