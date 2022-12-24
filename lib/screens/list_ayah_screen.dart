import 'package:audioplayers/audioplayers.dart';
import 'package:demotheholyquran/models/ayahmodel.dart';
import 'package:demotheholyquran/models/surahmodel.dart';
import 'package:demotheholyquran/services/api_service.dart';
import 'package:flutter/material.dart';

class ListOfAyahScreen extends StatefulWidget {
  const ListOfAyahScreen({super.key});

  @override
  State<ListOfAyahScreen> createState() => _ListOfAyahScreenState();
}

class _ListOfAyahScreenState extends State<ListOfAyahScreen> {
  var apiService = ApiService();
  List<Ayah> list = [];
  @override
  void initState() {
    Surah args;
    Future.delayed(Duration.zero).then((value) => {
          args = ModalRoute.of(context)!.settings.arguments as Surah,
          apiService.getSurah(args.number).then((value) => {
                for (var i = 0; i < value.ayahs.length; i++)
                  {
                    setState(() {
                      list.add(value.ayahs[i]);
                    })
                  }
              })
        });
  }

  void play(String x) async {
    final myaudio = AudioPlayer();
    myaudio.stop();
    late Source audioUrl;
    audioUrl = UrlSource(x);
    myaudio.play(audioUrl);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Surah;
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(args.name),
      ),
      body: ListView(
          children: list
              .map((e) => InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          e.text,
                          style: TextStyle(fontSize: 20),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    onTap: () => {play(e.audio)},
                  ))
              .toList()),
    );
  }
}
