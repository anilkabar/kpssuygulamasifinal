import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kpssuygulamasi/models/OzetlerData.dart';

class kpssOzetlerService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> savekpssOzetler(kpssOzetler kpssOzetlerData) {
    return _db
        .collection('kpssOzetler')
        .doc(kpssOzetlerData.id)
        .set(kpssOzetlerData.toMap());
  }

  Stream<List<kpssOzetler>> getkpssOzetler(String sonders) {
    return _db
        .collection('kpssOzetler')
        .where('Ders_Adi', isEqualTo: sonders)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => kpssOzetler.fromFirestore(document.data()))
            .toList());
  }

  Stream<List<kpssOzetler>> getkpssOzetler2(String sonders) {
    return _db
        .collection('kpssOzetler')
        .where('Ders_Adi', isEqualTo: sonders)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => kpssOzetler.fromFirestore(document.data()))
            .toList());
  }

  Future<void> removeProduct(String id) {
    return _db.collection('kpssOzetler').doc(id).delete();
  }
}
