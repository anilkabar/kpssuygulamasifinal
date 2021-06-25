class kpssDenemeler {
  int id;
  String Adi;

  kpssDenemeler.WithId(int id, String Adi) {
    this.id = id;
    this.Adi = Adi;
  }

  kpssDenemeler(String Adi) {
    this.id = id;
    this.Adi = Adi;
  }
}

List<kpssDenemeler> turkceDenemelerData = [
  kpssDenemeler.WithId(1, "Deneme 1"),
  kpssDenemeler.WithId(2, "Deneme 2")
];

List<kpssDenemeler> matematikDenemelerData = [
  kpssDenemeler.WithId(1, "Ondalıklı Sayılar"),
  kpssDenemeler.WithId(2, "Matematik")
];
