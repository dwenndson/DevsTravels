import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customDrawer.dart';
import '../partials/citybox.dart';

class ContinentPage extends StatelessWidget {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue'
  );

  void seeCityAction(context, continentIndex){
    print(continentIndex);
    Navigator.pushNamed(context, '/listcity', arguments: continentIndex);
  }

  void cityBoxAction(context, cityData){
    print(cityData['name']);
    Navigator.pushNamed(context, '/citydetails', arguments:  cityData);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Escolha um continente',
        ),
        drawer: customDrawer(
            pageContext: context
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: ListView.builder(
              itemCount: appdata.data.length,
              itemBuilder:(context, index){
                //appdata.data[index]['name']

                var cities = [];

                for(var country in appdata.data[index]['countries']){
                  cities.addAll( country['cities']);
                }
                
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "${appdata.data[index]['name']} (${cities.length})",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                        ),
                        
                        FlatButton(
                          child: Text(
                              'Ver Cidades',
                            style: TextStyle(
                              fontFamily: 'Helvitica Neue',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                          ),
                          onPressed: (){
                            seeCityAction(context, index);
                          },
                        ),

                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cities.length,
                        itemBuilder: (cityContext, cityIndex){
                          return CityBox(
                            data: cities[cityIndex],
                            onTap: cityBoxAction,
                          );
                        },
                      ),
                    )
                  ],
                );
              }
          )
        ),
      ),
    );
  }
}