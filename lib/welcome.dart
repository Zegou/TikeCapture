import 'package:flutter/material.dart';
import 'package:tike_consumer/splashscreen.dart';
import 'package:tike_consumer/main.dart';

import 'Login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Bienvenue sur Ticke",
    home: Welcome(),
  ));
 }

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SplashScreen.timer(
      seconds: 10,
      navigateAfterSeconds: Login(),

      /*image: Image.network(
        'https://flutter.io/images/catalog-widget-placeholder.png',
      ),*/

      backgroundColor: Colors.white,
      loaderColor: Colors.black,
      imageBackground:  new AssetImage("assets/images/tikegif.gif"),
       loadingText: Text(
        'www.tike.link',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0 , color: Colors.white, fontFamily: 'MontserratRegular')
      ),

    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome In SplashScreen Package'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Succeeded!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );
  }
}