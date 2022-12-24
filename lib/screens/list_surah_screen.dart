import 'package:demotheholyquran/models/surahmodel.dart';
import 'package:demotheholyquran/services/api_service.dart';
import 'package:flutter/material.dart';

class ListOfsurahScreen extends StatefulWidget {
  const ListOfsurahScreen({super.key});

  @override
  State<ListOfsurahScreen> createState() => _ListOfsurahScreenState();
}

class _ListOfsurahScreenState extends State<ListOfsurahScreen> {
  var apiService = ApiService();
  List<Surah> list = [];
  Surah sur = new Surah(
      number: 0,
      name: "",
      englishName: "",
      englishNameTranslation: "",
      revelationType: "",
      numberOfAyahs: 0);
  @override
  void initState() {
    Surah x;
    apiService.getListSurah().then(((value) => {
          for (var i = 0; i < value.data.length; i++)
            {
              setState(() {
                list.add(value.data[i]);
              })
            }
        }));
  }

  Widget build(BuildContext context) {
    print(list.length);
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("القران الكريم"),
      ),
      body: ListView(
          children: list
              .map((e) => InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(e.name,style: TextStyle(fontSize: 23),),
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    onTap: () => {
                      Navigator.of(context)
                                .pushNamed("/ayah", arguments:e)
                    },
                  ))
              .toList()),
    );
  }
}
