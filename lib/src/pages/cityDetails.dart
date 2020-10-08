import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class CityDetailsPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void print(appdata){
    print(appdata.data);
  }


  TextStyle style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) {
        return Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            appBar: CustomAppBar(
                scaffoldKey: _scaffoldKey,
                pageContext: context,
                title: 'Cidade detalhes',
                showBack: true
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Image.asset("${appdata.data}")
                ],
              ),
            )
        );
      }
    );
  }
}