import 'package:flutter/material.dart';
import 'package:max/pages/main_page.dart';
import 'package:max/pages/google_map_page.dart';
import 'package:max/pages/add_user.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('th', 'TH')],
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff4a6572),
          fontFamily: 'Sarabun',
          primaryColor: Color(0xff232f34),
          accentColor: Color(0xfff9aa33)),
      title: 'TEST APPLICATION',
      home: MainPage(),
      routes: {
        '/google-map': (context) => GoogleMapPage('1234'),
        '/add-user': (context) => AddUserPage()
      },
    );
  }
}
