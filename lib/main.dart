import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/Utils/Enum.dart';
import 'package:kpssuygulamasi/page/Bolumler.dart'; //android görüntüsü için ekleniyor
import 'package:kpssuygulamasi/page/bottom_nav.dart';
import 'package:kpssuygulamasi/providers/kpssOzetler_provider.dart';
import 'package:kpssuygulamasi/services/kpssOzetler_service.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => kpssOzetlerProvider()),
        StreamProvider(
            catchError: (_, __) => null,
            create: (context) => kpssOzetlerService()
                .getkpssOzetler(_KpssUygulamasiState().getDers)),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: BottomNavScreen())));
}

class KpssUygulamasi extends StatefulWidget {
  const KpssUygulamasi({key}) : super(key: key);

  @override
  _KpssUygulamasiState createState() => _KpssUygulamasiState();
}

class _KpssUygulamasiState extends State<KpssUygulamasi> {
  var seciliDers;
  var getDers;
  String title = "Kpss Uygulaması";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildBody(context),

      //buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Image(image: AssetImage('assets/images/kitap2.jpg')),
                ),
                title: Text("Türkçe"),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  child: Text(
                    "Başla",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    getDers = "t";
                    main();
                    setState(() {
                      getDers = "t";
                      print(getDers);
                      seciliDers = kpssDersler.turkce;
                      main();
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bolumler(
                                  seciliDers: kpssDersler.turkce,
                                )));
                  },
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Image(image: AssetImage('assets/images/kitap3.png')),
                ),
                title: Text("Matematik"),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  child: Text(
                    "Başla",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      getDers = "m";
                      seciliDers = kpssDersler.matematik;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bolumler(
                                  seciliDers: kpssDersler.matematik,
                                )));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
