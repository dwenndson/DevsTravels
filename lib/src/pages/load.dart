import 'package:flutter/material.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/assets/devstravelMenor.png',
            width: 200
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text('Carregando Informações...',
                style: TextStyle(
                fontSize: 16,
                ),
              )
            ),

            CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),

            Container(
              margin: EdgeInsets.all(30),
              child: Text('Php nunca será um mobile',
                style: TextStyle(
                  fontSize: 11
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}