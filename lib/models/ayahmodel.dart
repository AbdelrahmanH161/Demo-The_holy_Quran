class Ayah {
  int number;
  String audio;
  String text;
  int numberInSurah;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;
  bool sajda;
  Ayah({
    required this.number,
    required this.audio,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });
}

class ResponseAyahs {
  int code;
  String status;
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  int numberOfAyahs;
  List<dynamic> ayahs;
  ResponseAyahs({
    required this.code,
    required this.status,
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
    required this.ayahs
  });
}