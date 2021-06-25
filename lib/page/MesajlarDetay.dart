import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/models/db_utils.dart';
import 'package:kpssuygulamasi/models/iletisimData.dart';

DbUtils utils = DbUtils();

class MesajlarDetay extends StatefulWidget {
  @override
  _MesajlarDetayState createState() => _MesajlarDetayState();
}

class _MesajlarDetayState extends State<MesajlarDetay> {
  int say = 1;
  List<kpssiletisim> mesajList = [];

  void getData() async {
    await utils.kpssiletisimMesaj().then((result) => {
          setState(() {
            mesajList = result;
          })
        });
    print(mesajList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Mesajlar Detay"),
        ),
        body: ListView.builder(
            itemCount: mesajList.length,
            itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        index.bitLength.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(mesajList[index].adi +
                        "                              " +
                        mesajList[index].eposta),
                    subtitle: Text(mesajList[index].mesaj),
                  ),
                )));
  }
}
