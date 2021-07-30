
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:path/path.dart';
import 'package:tike_consumer/collapsing_profile.dart';
import 'package:tike_consumer/collapsing_tab.dart';
import 'package:tike_consumer/main_multi_without_dialog.dart';
import 'package:tike_consumer/src/themes/light_color.dart';
import 'package:tike_consumer/tab_screen.dart';
import 'dart:async';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'package:flutter/material.dart';

import 'TicketsDetailsEvent.dart';

class EventDetails  extends StatefulWidget {
  final String title;
  final String id;
  final String code ;

  EventDetails({this.id, this.code, this.title}) ;


  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState(codereceive: code);
}

class _MainCollapsingToolbarState extends State<EventDetails> {



     String codereceive;
  _MainCollapsingToolbarState({this.codereceive}) ;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                foregroundColor: Colors.white10,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("EVENT NAME",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "MontserratSemiBold"
                        )),

                    background: new Image.asset(
                      "assets/images/peopleinfestival.png",
                      fit: BoxFit.cover,
                    )),
              ),
              /*SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.add_circle_outline), text: "Détails 1"),
                      Tab(icon: Icon(Icons.mobile_screen_share_sharp), text: "Commander"),

                    ],
                  ),
                ),
                pinned: true,
              ),*/
            ];
          },
          body: new Container(
            child: Container(
               child :


                     SingleChildScrollView(
                                child: Column(

/*
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
*/
                                  children: <Widget>[
                                    Padding(

                                        padding: const EdgeInsets.all(10.0),

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Column(
                                                    children: [

                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                          children: [

                                                            Text(
                                                              '#Secondary',
                                                              style: TextStyle(color: Colors.black12.withOpacity(0.6), fontFamily: "MontserratLight"),
                                                              textAlign: TextAlign.left,

                                                            ),
                                                            Text("  "),
                                                            Text(
                                                              '#Secondary',
                                                              style: TextStyle(color: Colors.black12.withOpacity(0.6), fontFamily: "MontserratLight"),
                                                              textAlign: TextAlign.left,
                                                            )
                                                          ])


                                                    ]
                                                )


                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.0,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                    children: [

                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                          children: [
                                                            Text(
                                                              'Greyhound divisively hello coldly',
                                                              style: TextStyle(color: Colors.black, fontFamily: "MontserratBlack" , fontSize: 20 ),
                                                              textAlign: TextAlign.left,

                                                            ),

                                                          ])


                                                    ]
                                                )


                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                    children: [

                                                      Row(
                                                          children: [
                                                            Icon(Icons.access_alarm_outlined, color: Colors.black , size: 30,),
                                                            Text("  "),
                                                            Text(
                                                              'SUN, MAR 25 - 4:30 PM EST',
                                                              style: TextStyle(color: Colors.black12.withOpacity(0.6), fontFamily: "MontserratLight",fontSize: 17),
                                                              textAlign: TextAlign.left,
                                                            )
                                                          ])


                                                    ]
                                                )


                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                    children: [

                                                      Row(
                                                          children: [
                                                            Icon(Icons.apps_outlined, color: Colors.black12 , size: 30,),
                                                            Text("  "),
                                                            Text(
                                                              '2568/10k attending',
                                                              style: TextStyle(color: Colors.black, fontFamily: "MontserratLight",fontSize: 15),
                                                              textAlign: TextAlign.left,
                                                            )
                                                          ])


                                                    ]
                                                ),


                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  /*   Text("                                     "),

                                              Text(
                                                '10km',
                                                style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: "MontserratRegular"),
                                                textAlign: TextAlign.left,

                                              )*/

                                                  Container(
                                                    margin: EdgeInsets.all(2),
                                                    width: 40,
                                                    height: 40,
                                                    decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(image: new AssetImage("assets/images/profile-screen-avatar.jpg"), fit: BoxFit.fill,),                ),
                                                  ),




                                                  Container(
                                                    margin: EdgeInsets.all(2),
                                                    width: 40,
                                                    height: 40,
                                                    decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(image: new AssetImage("assets/images/smiling.png"), fit: BoxFit.fill,),                ),
                                                  ),

                                                  Container(
                                                    margin: EdgeInsets.all(2),
                                                    width: 40,
                                                    height: 40,
                                                    decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: new DecorationImage(image: new AssetImage("assets/images/smiling.png"), fit: BoxFit.fill,),                ),
                                                  ),

                                                  Container(
                                                    margin: EdgeInsets.all(2),
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                                                          fit: BoxFit.fill
                                                      ),

                                                    ),
                                                  ),

                                                  Text("                "),



                                                ]),
                                            SizedBox(
                                              height: 20.0,
                                            ),

                                          ],
                                        )

                                    ),
                                    Container(
                                      color: Colors.black12,
                                      padding: const EdgeInsets.all(10.0),
                                      child:  Row(

                                        children: [
                                          Column(
                                              children: [

                                                Text(
                                                  '4.5',
                                                  style: TextStyle(color: Colors.black, fontFamily: "MontserratBlack",fontSize: 40),
                                                  textAlign: TextAlign.left,
                                                )



                                              ]
                                          ),
                                          Column(
                                              children: [

                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text("               "),
                                                      Icon(Icons.star, color: Colors.black12),
                                                      Icon(Icons.star, color: Colors.black12),
                                                      Icon(Icons.star, color: Colors.black12),
                                                      Icon(Icons.star, color: Colors.black),
                                                      Icon(Icons.star, color: Colors.black),


                                                      Text(
                                                          ' '
                                                      ),
                                                      Text(
                                                        '1.3K',
                                                        style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: "MontserratRegular"),
                                                        textAlign: TextAlign.left,

                                                      )
                                                    ]),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Row(
                                                    children: [
                                                      Text(
                                                        '214 reviews',
                                                        style: TextStyle(color: Colors.black, fontFamily: "MontserratLight",fontSize: 20),
                                                        textAlign: TextAlign.left,
                                                      )
                                                    ]
                                                )


                                              ]
                                          ),
                                          Column(

                                              children: [

                                                Row(
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[

                                                            Text("  "),
                                                            Icon(Icons.comment,size: 30),
                                                          ]
                                                      ),
                                                      Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text("  "),
                                                            Text('Write Review',)
                                                          ]
                                                      )
                                                    ]
                                                )

                                              ]
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      color: Colors.white10,
                                      padding: const EdgeInsets.all(10.0),
                                      child:  Row(

                                        children: [
                                          Column(
                                              children: [
                                                Text("ABOUT",style: TextStyle(fontFamily: "MontserratSemiBold", fontSize: 18 , color :Colors.black26),)
                                              ]
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      color: Colors.white10,
                                      padding: const EdgeInsets.all(10.0),

                                      child:  Row(

                                        children: [
                                          Column(
                                              children: [
                                                Text("Why this party is for you\n\n Let's play the silent game, but this time you have to \n\n dance under the stars", style: TextStyle(fontFamily: "MontserratRegular"))
                                              ]
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      color: Colors.white10,
                                      padding: const EdgeInsets.all(10.0),
                                      child:  Row(

                                        children: [
                                          Column(
                                            children: [
                                                  Text("                                              "),
                                            ]
                                          ),
                                          Column(
                                              children: [
                                            Text("                                           "),
                                              ]
                                          ),
                                          Column(
                                              children: [
                                                Text("Details", style: TextStyle(fontFamily: "MontserratRegular", color :Color(0xffba1818) ,)),
                                              ]
                                          ),
                                          Column(
                                              children: [
                                                Icon(Icons.arrow_forward_ios_outlined, color :Color(0xffba1818))
                                              ]
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      color: Colors.black12,
                                      padding: const EdgeInsets.all(10.0),
                                      child:  Row(

                                        children: [
                                          Column(
                                              children: [
                                                Text("LOCATION", style: TextStyle(fontFamily: "MontserratSemiBold", fontSize: 18, color: Colors.black26)),
                                              ]
                                          ),
                                          Column(
                                              children: [

                                              ]
                                          ),
                                          Column(
                                              children: [
                                                Text("                                       "),
                                              ]
                                          ),

                                         /* Column(
                                              children: [
                                                Text("How to get there ?", style: TextStyle(fontFamily: "MontserratLight",color: Color(0xffba1818) , fontWeight: FontWeight.bold )),
                                              ]
                                          ),
                                          Column(

                                              children: [
                                                Icon(Icons.arrow_forward_ios_outlined, color: Color(0xffba1818)),

                                              ]
                                          ),*/
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.black12,
                                      padding: const EdgeInsets.all(10.0),
                                      child:  Row(

                                        children: [

                                          Column(
                                              children: [
                                                Text("Stage 48", style: TextStyle(fontFamily: "MontserratRegular",color: Colors.black, fontSize: 17)),
                                              ]
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.black12,
                                      padding: const EdgeInsets.all(10.0),
                                      child:  Row(

                                        children: [

                                          Column(
                                              children: [
                                                Text("Tobacco Dock , London", style: TextStyle(fontFamily: "MontserratRegular", color: Colors.black , fontSize: 17)),
                                              ]
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color: Colors.black12,
                                      padding: const EdgeInsets.all(10.0),
                                      child:  Row(

                                        children: [

                                          Column(
                                              children: [
                                                Text("15km nearly", style: TextStyle(fontFamily: "MontserratRegular", color: Colors.black , fontSize: 17)),
                                              ]
                                          )
                                        ],
                                      ),
                                    ),
                                /*    SizedBox(
                                      height: 10.0,
                                    ),*/
                                 /*   SizedBox(
                                      height: 10.0,
                                    ),*/
                                    Container(
                                      color: Colors.black12,
                                      padding: const EdgeInsets.all(10.0),
                                      child:  Row(

                                        children: [
                                          Column(
                                              children: [
                                                Text("                                      "),
                                              ]
                                          ),
                                          Column(
                                              children: [
                                                Text("                            "),
                                              ]
                                          ),
                                          Column(
                                              children: [
                                                Text("How to get there ?", style: TextStyle(fontFamily: "MontserratRegular", color :Color(0xffba1818) ,)),
                                              ]
                                          ),
                                          Column(
                                              children: [
                                                Icon(Icons.arrow_forward_ios_outlined, color :Color(0xffba1818))
                                              ]
                                          )
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: 300.0,
                                        child : GoogleMap(
                                          mapType: MapType.terrain,
                                          initialCameraPosition: _kGooglePlex,
                                          onMapCreated: (GoogleMapController controller) {
                                            _controller.complete(controller);
                                          },

                                         ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      color: Colors.white10,
                                      padding: const EdgeInsets.all(10.0),
                                      child:  Row(

                                        children: [
                                          Column(
                                              children: [
                                                Text("CONTACT",style: TextStyle(fontFamily: "MontserratSemiBold", fontSize: 18, color: Colors.black26),)
                                              ]
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      color: Colors.white10,
                                     padding: EdgeInsets.only(left: 10 ,right: 10 , bottom: 10),
                                      child:  Row(

                                        children: [

                                                Text("Send us an email at", style: TextStyle(fontFamily: "MontserratRegular")),
                                                Text(" help@capturesolutions.com ", style: TextStyle(fontFamily: "MontserratRegular", color :Color(0xffba1818))),
                                                Text("or call", style: TextStyle(fontFamily: "MontserratRegular")),


                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:5.0,
                                    ),
                                    Container(
                                      color: Colors.white10,
                                      padding: EdgeInsets.only(left: 10 ,right: 10 , bottom: 10),
                                      child:  Row(

                                        children: [

                                          Text("at +22503718997", style: TextStyle(fontFamily: "MontserratRegular")),

                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:15.0,
                                    ),
                                    ElevatedButton(
                                      child: Text('From 20\$ - GET IT', style: TextStyle(fontFamily: "MontserratRegular")),
                                      onPressed: ()  =>   showDialog(
                                      context: context,
                                      barrierDismissible: false, // user must tap button for close dialog!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Votre code promo"),
                                          content:  Text("Voulez vous utilisez un code promo"),
                                          actions: [
                                            FlatButton(
                                              child: const Text('NO', style: TextStyle(fontFamily: 'MontserratMedium', color:Colors.black, fontWeight: FontWeight.bold

                                              )),

                                              onPressed: () {
                                                if(this.codereceive=="2"){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (c) => MainMultiWithoutDialog(id: "1" , promocode: "",title: "", code: this.codereceive))

                                                          /*TicketsDetailsEvent(id: "1" , promocode: "",title: ""))*/
                                                  );
                                                }else if(this.codereceive=="1"){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (c) => MainMultiWithoutDialog(id: "1" , promocode: "",title: "", code: this.codereceive)),

                                                          /*TicketsDetailsTransport(id: "1" , promocode: "",title: ""))*/
                                                  );



                                              }


                                                /*Navigator.of(context).pop(ConfirmAction.CANCEL);*/
                                              },
                                            ),
                                            FlatButton(
                                              child: const Text('YES',style: TextStyle(fontFamily: 'MontserratMedium', color:Colors.black, fontWeight: FontWeight.bold

                                              )),
                                              onPressed: () {
                                                if(this.codereceive=="2"){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (c) =>MainMultiWithoutDialog(id: "1" , promocode: "5",title: "", code: this.codereceive)),
                                                          /*TicketsDetailsEvent(id: "1" , promocode: "0000",title: ""))*/
                                                  );
                                                }else if(this.codereceive=="1"){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (c) => MainMultiWithoutDialog(id: "1" , promocode: "5",title: "", code: this.codereceive)) ,

                                                          /*TicketsDetailsTransport(id: "1" , promocode: "0000",title: ""))*/
                                                  );

                                                }
                                              },
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                      /*onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => TicketsDetails()),
                                      ),*/
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:10.0,
                                    ),

                                  ],

                                ),
                              ),

                        /*Row(
                                    children: <Widget>[
                                            GoogleMap(

                                              mapType: MapType.hybrid,
                                              initialCameraPosition: _kGooglePlex,
                                              onMapCreated: (GoogleMapController controller) {
                                                _controller.complete(controller);
                                              },

                                            )
                                         ,
                                      *//*GoogleMap(
                                        mapType: MapType.hybrid,
                                        initialCameraPosition: _kGooglePlex,
                                        onMapCreated: (GoogleMapController controller) {
                                          _controller.complete(controller);
                                        },
                                      ),*//*

                                       *//* FloatingActionButton.extended(
                                          onPressed: _goToTheLake,
                                          label: Text('To the lake!'),
                                          icon: Icon(Icons.directions_boat),
                                        ),*//*
                                ]),*/



            ),

            ),


        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
Widget Profile(BuildContext context){
  return Card(
    /* clipBehavior: Clip.antiAlias,*/
    child: InkWell(

/*
        elevation: 0.0,
*/
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventDetails()),
        );
        // Function is executed on tap.
      },
      child: Column(
        children: [

          Padding(

            padding: const EdgeInsets.all(0.0),

            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10)
                  ,bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: Image.asset(
                'assets/images/peopleinfestival.png',
                fit: BoxFit.cover,
              ),

            ),

          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Column(
                  children: [

                    Row(
                        children: [
                          Text(
                            '#Secondary',
                            style: TextStyle(color: Colors.black12.withOpacity(0.6), fontFamily: "MontserratLight"),
                            textAlign: TextAlign.left,

                          ),
                          Text("  "),
                          Text(
                            '#Secondary',
                            style: TextStyle(color: Colors.black12.withOpacity(0.6), fontFamily: "MontserratLight"),
                            textAlign: TextAlign.left,
                          )
                        ])


                  ]
              ),
              Column(
                  children: [

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("               "),
                          Icon(Icons.star, color: Colors.black12),
                          Icon(Icons.star, color: Colors.black12),
                          Icon(Icons.star, color: Colors.black12),
                          Icon(Icons.star, color: Colors.black),
                          Icon(Icons.star, color: Colors.black),


                          Text(
                              ' '
                          ),
                          Text(
                            '1.3K',
                            style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: "MontserratRegular"),
                            textAlign: TextAlign.left,

                          )
                        ]),



                  ]
              )


            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 5, 5),
                  child: Text(
                    'Greyhound divisively hello coldly coldly.',
                    style: TextStyle(color: Colors.black, fontFamily: "MontserratBlack" , fontSize: 17),
                  ),
                ),
              ]),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Column(
                  children: [

                    Row(
                        children: [
                          Icon(Icons.map, color: Colors.black12 , size: 30,),
                          Text("  "),
                          Text(
                            'Abidjan Cocody Riviera 2',
                            style: TextStyle(color: Colors.black12.withOpacity(0.6), fontFamily: "MontserratLight"),
                            textAlign: TextAlign.left,
                          )
                        ])


                  ]
              ),
              Column(
                  children: [

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("                                     "),

                          Text(
                            '10km',
                            style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: "MontserratRegular"),
                            textAlign: TextAlign.left,

                          )
                        ]),



                  ]
              )


            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Column(
                  children: [

                    Row(
                        children: [
                          Icon(Icons.apps_outlined, color: Colors.black12 , size: 30,),
                          Text("  "),
                          Text(
                            '2568/10k attending',
                            style: TextStyle(color: Colors.black12.withOpacity(0.6), fontFamily: "MontserratLight"),
                            textAlign: TextAlign.left,
                          )
                        ])


                  ]
              ),
              Column(
                  children: [

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /*   Text("                                     "),

                      Text(
                        '10km',
                        style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: "MontserratRegular"),
                        textAlign: TextAlign.left,

                      )*/
                          Text("                "),
                          Container(
                            margin: EdgeInsets.all(2),
                            width: 25,
                            height: 25,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(image: new AssetImage("assets/images/profile-screen-avatar.jpg"), fit: BoxFit.fill,),                ),
                          ),



                          Container(
                            margin: EdgeInsets.all(2),
                            width: 25,
                            height: 25,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(image: new AssetImage("assets/images/login_bg2white.png"), fit: BoxFit.fill,),                ),
                          ),

                          Container(
                            margin: EdgeInsets.all(2),
                            width: 25,
                            height: 25,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(image: new AssetImage("assets/images/smiling.png"), fit: BoxFit.fill,),                ),
                          ),

                          Container(
                            margin: EdgeInsets.all(2),
                            width: 25,
                            height: 25,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(image: new AssetImage("assets/images/smiling.png"), fit: BoxFit.fill,),                ),
                          ),

                          Container(
                            margin: EdgeInsets.all(2),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                                  fit: BoxFit.fill
                              ),

                            ),
                          )




                        ]),



                  ]
              )


            ],
          ),





          /*ListTile(
              leading: Icon(Icons.arrow_drop_down_circle),
              title: const Text('Card title 1'),
              subtitle: Text(
                'Secondary Text',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            )*/
        ],
      ),

    ),
  );
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
enum ConfirmAction { CANCEL, ACCEPT }

