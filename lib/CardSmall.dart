import 'package:flutter/material.dart';

import 'src/constants/Theme.dart';

class CardSmall extends StatelessWidget {
  CardSmall(
      {
        this.title = "Placeholder Title",
        this.cta = "",
        this.img = "https://via.placeholder.com/200",
        this.tap = defaultFunc, TextStyle style});

  final String cta;
  final String img;
  final GestureTapCallback tap;
  final String title;

  static void defaultFunc() {


    /* print("the function works!");*/
  }

  @override
  Widget build(BuildContext context) {

    return Flexible(
        child: Container(

          height: 350,
          padding: const EdgeInsets.all(3.0),
          child: GestureDetector(
            onTap:tap ,
            child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                 ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Flexible(
                        flex: 5,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0) ,
                                bottomRight: Radius.circular(10.0)),

                                image: new DecorationImage(image: new AssetImage(img), fit: BoxFit.cover)
                                /*image: DecorationImage(
                                  image: NetworkImage(img),
                                  fit: BoxFit.cover,
                                )*/))),
                    Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
    top: 3.0/*, bottom: 2.0, left: 8.0*/),
                          child: Column(
/*
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
*/

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,
                                  style: TextStyle(fontFamily: "spacegroteskbold",
                                      color: Colors.black/*ArgonColors.header*/, fontSize: 15 , fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(cta,
                                    style: TextStyle(
                                        color: Colors.black26/*ArgonColors.primary*/,
                                        fontFamily: "spacegroteskregular",
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600)),
                              )
                            ],
                          ),
                        ))
                  ],
                )),
          ),
        ));
  }
}
