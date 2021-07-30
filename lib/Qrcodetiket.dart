import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tike_consumer/TicketsDetailsEvent.dart';
import 'package:tike_consumer/main.dart';

class QrCode extends StatefulWidget {
  @override
  _QrCode createState() => _QrCode();
}
class _QrCode  extends State<QrCode> {
  String _chosenValue="";
  int _value = 1;
  TextStyle style = TextStyle(fontFamily: 'MontserratRegular', color:Colors.black,

  );
  TextStyle styleTitle = TextStyle(fontFamily: 'MontserratBold', color:Colors.black,

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_outlined),
          title: Text('Qrcode page'),
          titleTextStyle: styleTitle,
          actions: [
            /* Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),*/
            Icon(Icons.more_vert),
          ],
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/tikebgblack.png"
                        )
                        /*image: NetworkImage(
                            "assets/images/tikebgblack.png"
                        )*/,
                        fit: BoxFit.cover
                    )
                ),

                child: Container(

                  width: double.infinity,
                  height: 140,
                  child: Container(

                    alignment: Alignment(0.0,2.5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/images/profile-screen-avatar.jpg"
                      ),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 40,
              ),
              QrImage(
                data: "1234567890",
                version: QrVersions.auto,
                size: 200.0,
              ),

            ],
          ),
        )
    );
  }
}