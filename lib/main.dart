import 'package:demotheholyquran/screens/list_ayah_screen.dart';
import 'package:demotheholyquran/screens/list_surah_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    ],
  supportedLocales: [
    Locale('en', ''), // English, no country code
    Locale('ar', ''), // Spanish, no country code
  ],
      title: 'Demo_The_Holy_Quran',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/",
      routes: {
        "/":(context)=> ListOfsurahScreen(),
        "/ayah":(context)=> ListOfAyahScreen(),
      },
    );
  }
}
