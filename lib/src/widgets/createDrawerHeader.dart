import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('assets/images/bg_header.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Application Parents/ Etudiants",
                style: TextStyle(
                  color: Color(0xFF102397),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "spacegroteskmedium",
                ))),
      ]));
}