class Videolar {
  int id;
  String videoAdi;
  String seoUrl;

  Videolar(this.id, this.videoAdi, this.seoUrl);

  Videolar.fromJson(Map json) {
    id = json["id"];
    videoAdi = json["videoAdi"];
    seoUrl = json["seoUrl"];
  }
}
