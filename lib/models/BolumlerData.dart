class kpssBolumler {
  String Adi;
  String Url;

  kpssBolumler(String Adi, String Url) {
    this.Adi = Adi;
    this.Url = Url;
  }
}

List<kpssBolumler> turkceBolumlerData = [
  kpssBolumler("Ozetler", "Ozetler"),
  kpssBolumler("Deneme Sınavi", "DenemeSinavlari"),
  kpssBolumler("Deneme Sınavi", "DenemeSinavlari"),
];

List<kpssBolumler> matematikBolumlerData = [
  kpssBolumler("matematik", "Ozetler"),
  kpssBolumler("Deneme Sınavi", "DenemeSinavlari"),
];
List<kpssBolumler> cografyaBolumlerData = [
  kpssBolumler("Coğrafya", "Ozetler"),
  kpssBolumler("Deneme Sınavi", "DenemeSinavlari"),
];
