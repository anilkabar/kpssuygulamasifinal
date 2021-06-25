import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/Utils/Enum.dart';
import 'package:kpssuygulamasi/models/DenemelerData.dart';
import 'package:kpssuygulamasi/models/OzetlerData.dart';
import 'package:kpssuygulamasi/page/DenemelerDetay.dart';
import 'package:kpssuygulamasi/page/OzetlerDetay.dart';

class DenemeSinavlari extends StatefulWidget {
  var seciliDers;
  DenemeSinavlari({this.seciliDers});
  @override
  _DenemeSinavlariState createState() => _DenemeSinavlariState();
}

class _DenemeSinavlariState extends State<DenemeSinavlari> {
  kpssDenemeler seciliDeneme = kpssDenemeler.WithId(0, "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DenemeSinavlari"),
      ),
      body: Column(
        children: <Widget>[
          builVeriler(context, widget.seciliDers),
        ],
      ),
    );
  }

  Widget builVeriler(BuildContext context, var seciliDers) {
    if (seciliDers == kpssDersler.turkce) {
      return Expanded(
        child: ListView.builder(
            itemCount: turkceDenemelerData.length,
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
                      turkceDenemelerData[index].Adi,
                      style: TextStyle(),
                      // textAlign: Alignment.center,
                    ),
                    onTap: () {
                      setState(() {
                        seciliDeneme = turkceDenemelerData[index];
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DenemelerDetay(seciliDeneme)));
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
    } else if (seciliDers == kpssDersler.matematik) {
      return Expanded(
        child: ListView.builder(
            itemCount: 2,
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
                      matematikDenemelerData[index].Adi,
                      style: TextStyle(),
                      // textAlign: Alignment.center,
                    ),
                    onTap: () {
                      setState(() {
                        seciliDeneme = matematikDenemelerData[index];
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DenemelerDetay(seciliDeneme)));
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
