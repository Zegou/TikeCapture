import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:tike_consumer/src/widgets/createDrawerHeader.dart";
import 'package:tike_consumer/src/widgets/createDrawerBodyItem.dart';

class navigationDrawer extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'spacegroteskmedium', fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Accueil',
            onTap: () =>{

            }
              ,
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'Profile',
            onTap: () =>{
                    },
          ),
          createDrawerBodyItem(
            icon: Icons.access_time_rounded,
            text: 'Présence Etudiants',
              onTap: () =>{
              }),
          createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Notes Etudiants',
              onTap: () =>{
              }),
          createDrawerBodyItem(
            icon: Icons.payment,
            text: 'Payments',
            onTap: () =>{
            },
          )
          /*createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Evènement UIPA',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.event),
          )*/,
          Divider(),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: 'Notifications',
            onTap: () =>{
            },
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Contact',
              onTap: () =>{
              },
          ),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}