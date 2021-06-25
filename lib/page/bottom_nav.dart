import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/main.dart';
import 'Admin/Login.dart';
import 'package:kpssuygulamasi/page/Hakkimizda.dart';
import 'package:kpssuygulamasi/page/Ozetler.dart';
import 'package:kpssuygulamasi/page/iletisim.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _page = [
    KpssUygulamasi(),
    iletisim(),
    Hakkimizda(),
    Login(),
  ];
  int _seciliSayfa = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_seciliSayfa],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _seciliSayfa,
        onTap: (index) => setState(() => _seciliSayfa = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.messenger, Icons.info, Icons.person]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    title: Text(""),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _seciliSayfa == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
