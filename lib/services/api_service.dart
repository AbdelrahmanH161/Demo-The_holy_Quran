import 'dart:convert';

import 'package:demotheholyquran/models/ayahmodel.dart';
import 'package:demotheholyquran/models/surahmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ResponseAyahs> getSurah(int x) async {
    Uri url = Uri.http("api.alquran.cloud", "/v1/surah/${x}/ar.alafasy");
    var resp = await http.get(url);
    dynamic data = jsonDecode(resp.body);

    return ResponseAyahs(
      code: data["code"],
      status: data["status"],
      number: data["data"]["number"],
      name: data["data"]["name"],
      englishName: data["data"]["englishName"],
      englishNameTranslation: data["data"]["englishNameTranslation"],
      revelationType: data["data"]["revelationType"],
      numberOfAyahs: data["data"]["numberOfAyahs"],
      ayahs: data["data"]["ayahs"]
          .map((e) => Ayah(
              number: e["number"],
              audio: e["audio"],
              text: e["text"],
              numberInSurah: e["numberInSurah"],
              juz: e["juz"],
              manzil: e["manzil"],
              page: e["page"],
              ruku: e["ruku"],
              hizbQuarter: e["hizbQuarter"],
              sajda: e["sajda"]))
          .toList(),
    );
  }

  Future<ResponseSurah> getListSurah() async {
    Uri url = Uri.http("api.alquran.cloud", "/v1/surah");
    var resp = await http.get(url);
    dynamic data = jsonDecode(resp.body);
    return ResponseSurah(
        code: data["code"],
        status: data["status"],
        data: data["data"]
            .map((e) => Surah(
                number: e["number"],
                name: e["name"],
                englishName: e["englishName"],
                englishNameTranslation: e["englishNameTranslation"],
                revelationType: e["revelationType"],
                numberOfAyahs: e["numberOfAyahs"]))
            .toList() );
  }
}
