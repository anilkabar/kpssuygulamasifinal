import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/models/DenemeSorulariData.dart';
import 'package:kpssuygulamasi/models/DenemelerData.dart';
import 'package:kpssuygulamasi/models/OzetlerData.dart';

kpssDenemeler seciliDeneme;
void main() {
  runApp(MaterialApp(home: DenemelerDetay(seciliDeneme)));
}

class DenemelerDetay extends StatefulWidget {
  kpssDenemeler seciliDeneme;
  DenemelerDetay(kpssDenemeler seciliDeneme) {
    this.seciliDeneme = seciliDeneme;
  }

  @override
  _DenemelerDetayState createState() => _DenemelerDetayState(seciliDeneme);
}

class _DenemelerDetayState extends State<DenemelerDetay> {
  List kpssSoruSecenek = [];
  var secenekler = ['A', 'B', 'C', 'D', 'E'];
  var secilenCevap;
  kpssDenemeler seciliDeneme;
  _DenemelerDetayState(kpssDenemeler seciliDeneme) {
    this.seciliDeneme = seciliDeneme;
  }

  @override
  Widget build(BuildContext context) {
    for (var u in kpssDenemeSorulari[0]['kpssSoruSecenek']) {
      kpssSoruSecenek.add(u);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(seciliDeneme.Adi),
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          padding: EdgeInsets.all(20),
          width: 450,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(children: [
            Text(
              kpssDenemeSorulari[0]['kpssSoru'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: kpssSoruSecenek.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: ListTile(
                      leading: Text(
                        secenekler[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      title: Text(kpssSoruSecenek[index],
                          style: TextStyle(fontSize: 20)),
                      onTap: () {
                        setState(() {});
                        secilenCevap = kpssSoruSecenek[index];
                      },
                    ),
                  );
                },
              ),
            ),
            Text("Secilen Cevap" + secilenCevap.toString())
          ]),
        ),
      ],
    );
  }

  denemeBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemCount: secenekler.toString().length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text(secenekler[index].toString()),
              title: Text("deneme"),
            );
          },
        )),
      ],
    );
  }
}
