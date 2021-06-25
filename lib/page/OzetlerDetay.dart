import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/models/OzetlerData.dart';

class OzetlerDetay extends StatefulWidget {
  final kpssOzetler ozetlerData;

  OzetlerDetay([this.ozetlerData]);
  @override
  _OzetlerDetayState createState() => _OzetlerDetayState();
}

class _OzetlerDetayState extends State<OzetlerDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ozetlerData.Adi),
      ),
      body: Container(
        child: Scrollbar(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.ozetlerData.Icerik),
              );
            },
          ),
        ),
      ),
    );
  }
}
