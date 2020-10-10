import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';


class ScreenArguments {
  final String name;
  final String review;
  final String description;
  final List<dynamic> places;


  ScreenArguments(this.name, this.review, this.description, this.places);
}

class CityDetailsPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    final ScreenArguments cityData = ModalRoute.of(context).settings.arguments;

    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        return Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            appBar: CustomAppBar(
                scaffoldKey: _scaffoldKey,
                pageContext: context,
                title: cityData.name,
                showBack: true
            ),
            body: Stack(
              children: <Widget>[
                Image.network('${cityData.places[0]['img']}',),
                  Positioned(
                      left: 10,
                      right: 0,
                      bottom: 7,
                    child: Text(
                      cityData.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'Helvetica Neue'
                      ),
                    )
                  )
              ]
            )
        );
      }
    );
  }
}