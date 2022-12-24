import 'package:demotheholyquran/models/ayahmodel.dart';

class Surah {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  int numberOfAyahs;
  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
  });
}

class ResponseSurah {
  int code;
  String status;
  List<dynamic> data;
  ResponseSurah({
    required this.code,
    required this.status,
    required this.data
  });
}
