import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/assets/devstravelMenor.png',
            width: 200
            ),

            loading ? Container(
              margin: EdgeInsets.all(20),
              child: Text('Carregando Informações...',
                style: TextStyle(
                fontSize: 16,
                ),
              )
            ) : Container(),

            loading ? CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ): Container(),

            !loading ? Container(
              margin: EdgeInsets.all(30),
              child: RaisedButton(
                child: Text('Tentar novamente'),
                onPressed: (){},
                ),
              ): Container(),
          ],
        ),
      ),
    );
  }
}