class kpssiletisim {
  final int id;
  final String adi;
  final String eposta;
  final String telefon;
  final String mesaj;

  kpssiletisim({this.id, this.adi, this.eposta, this.telefon, this.mesaj});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'adi': adi,
      'eposta': eposta,
      'telefon': telefon,
      'mesaj': mesaj,
    };
  }

  @override
  String toString() {
    return 'kpssiletisim{id: $id, adi: $adi, eposta: $eposta,telefon:$telefon,mesaj:$mesaj}';
  }
}
