import 'package:devstravel/src/pages/cityDetails.dart';
import 'package:devstravel/src/pages/listCity.dart';
import 'package:devstravel/src/pages/load.dart';
import 'package:devstravel/src/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';

import 'src/pages/load.dart';
import 'src/pages/home.dart';
import 'src/pages/continent.dart';

void main() => runApp(
  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppData(),
        )
      ],
      child: MyApp(),
  )
);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/preload': (context) => PreloadPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/continent': (context) => ContinentPage(),
        '/listcity':(context) => ListCityPage(),
        '/citydetails':(context) => CityDetailsPage()
      },
      initialRoute: '/preload',
    );
  }
}

