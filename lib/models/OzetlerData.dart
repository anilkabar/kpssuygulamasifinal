class kpssOzetler {
  final String id;
  final String Adi;
  final String Icerik;
  final String Ders_Adi;

  kpssOzetler({this.id, this.Adi, this.Icerik, this.Ders_Adi});

  Map<String, dynamic> toMap() {
    return {'id': id, 'Adi': Adi, 'Icerik': Icerik, 'Ders_Adi': Ders_Adi};
  }

  kpssOzetler.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        Adi = firestore['Adi'],
        Icerik = firestore['Icerik'],
        Ders_Adi = firestore['Ders_Adi'];
}
