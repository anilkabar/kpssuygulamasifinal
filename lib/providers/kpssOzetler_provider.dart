import 'package:flutter/material.dart';
import 'package:kpssuygulamasi/models/OzetlerData.dart';
import 'package:kpssuygulamasi/services/kpssOzetler_service.dart';
import 'package:uuid/uuid.dart';

class kpssOzetlerProvider with ChangeNotifier {
  final firestoreService = kpssOzetlerService();
  String _id;
  String _Adi;
  String _Icerik;
  String _Ders_Adi;
  var uuid = Uuid();

  String get id => _id;

  String get Adi => _Adi;

  String get Icerik => _Icerik;

  String get Ders_Adi => _Ders_Adi;

  changeAdi(String value) {
    _Adi = value;
    notifyListeners();
  }

  changeIcerik(String value) {
    _Icerik = value;
    notifyListeners();
  }

  changeDersAdi(String value) {
    _Ders_Adi = value;
    notifyListeners();
  }

  loadValues(kpssOzetler kpssOzetlerData) {
    _id = kpssOzetlerData.id;
    _Adi = kpssOzetlerData.Adi;
    _Icerik = kpssOzetlerData.Icerik;
    _Ders_Adi = kpssOzetlerData.Ders_Adi;
  }

  saveProduct() {
    print(_id);
    if (_id == null) {
      var newkpssOzetler = kpssOzetler(
          id: uuid.v4(), Adi: Adi, Icerik: Icerik, Ders_Adi: Ders_Adi);
      firestoreService.savekpssOzetler(newkpssOzetler);
    } else {
      //Update
      var updatedkpssOzetler =
          kpssOzetler(id: id, Adi: Adi, Icerik: Icerik, Ders_Adi: Ders_Adi);
      firestoreService.savekpssOzetler(updatedkpssOzetler);
    }
  }

  removeProduct(String id) {
    firestoreService.removeProduct(id);
  }
}
