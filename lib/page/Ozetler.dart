import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/Utils/Enum.dart';
import 'package:kpssuygulamasi/models/OzetlerData.dart';
import 'package:kpssuygulamasi/page/OzetlerDetay.dart';
import 'package:kpssuygulamasi/providers/kpssOzetler_provider.dart';
import 'package:kpssuygulamasi/services/kpssOzetler_service.dart';
import 'package:provider/provider.dart';
import 'package:kpssuygulamasi/main.dart';

class Ozetler extends StatefulWidget {
  var seciliDers;
  var sonders;
  Ozetler({this.seciliDers, this.sonders});
  @override
  _OzetlerState createState() => _OzetlerState();
}

class _OzetlerState extends State<Ozetler> {
  var sonders;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kpss Konu Özetleri"),
      ),
      body: Column(
        children: <Widget>[builVeriler(context, widget.seciliDers)],
      ),
    );
  }

  Widget builVeriler(BuildContext context, var seciliDers) {
    final ozetlerData = Provider.of<List<kpssOzetler>>(context);
    final ozetlerData2 = Provider.of<List<kpssOzetler>>(context);

    //ozetlerData.where((element) => false);
    if (seciliDers == kpssDersler.turkce) {
      return Expanded(
        child: ListView.builder(
            itemCount: ozetlerData.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(1.0),
                  margin: EdgeInsets.all(7.0),
                  height: 40.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFEEEAEA), Color(0xFFEEEAEA)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: ListTile(
                    title: Text(
                      ozetlerData[index].Adi,
                      style: TextStyle(),
                      // textAlign: Alignment.center,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              OzetlerDetay(ozetlerData[index])));
                    },
                    trailing: Icon(
                      Icons.double_arrow_sharp,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }),
      );
    }

    if (seciliDers == kpssDersler.matematik) {
      return Expanded(
        child: ListView.builder(
            itemCount: ozetlerData2.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(1.0),
                  margin: EdgeInsets.all(7.0),
                  height: 40.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFEEEAEA), Color(0xFFEEEAEA)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: ListTile(
                    title: Text(
                      ozetlerData2[index].Adi,
                      style: TextStyle(),
                      // textAlign: Alignment.center,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              OzetlerDetay(ozetlerData2[index])));
                    },
                    trailing: Icon(
                      Icons.double_arrow_sharp,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }),
      );
    }
  }
}
