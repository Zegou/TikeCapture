import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tike_consumer/TicketsDetailsEvent.dart';
import 'package:tike_consumer/main.dart';

import 'main.dart';
class ProfileUI2 extends StatefulWidget {

  final int user_id;
  final String username ;
  final String autorization ;

   ProfileUI2({this.user_id, this.username, this.autorization});


  @override
  _ProfileUI2 createState() => _ProfileUI2(user_id: user_id, username: username , autorization: autorization);
}
class _ProfileUI2  extends State<ProfileUI2> {

  int user_id;
  String username ;
  String autorization ;

  _ProfileUI2({this.user_id, this.username, this.autorization});


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
          title: Text('Setting page'),
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
              Text(
                "Nom Complet"
                ,style: TextStyle(
                  fontSize: 25.0,
                  color:Colors.black,
                  letterSpacing: 2.0,
                  fontFamily: "MontserratBlack",
                  fontWeight: FontWeight.w400
              ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Kenya, Nairobi"
                ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
                fontFamily: "MontserratLight",

              )
             /* Text(
                "Côte d'ivoire, Abidjan"
                ,style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                fontFamily: "MontserratLight",

              )*/,
              ),
            /*  SizedBox(
                height: 10,
              ),
              Text(
                "App Developer at XYZ Company"
                ,style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),*/
              SizedBox(
                height: 7,
              ),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),

                  elevation: 0.0,

                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                      child: DropdownButton(
                        value: _value,
                        style: style,
                        items: [
                          DropdownMenuItem(
                          child: Text("Nairobi"),
                          value: 1,
                          ),
                          DropdownMenuItem(
                          child: Text("Second Item"),
                          value: 2,
                          ),
                          DropdownMenuItem(
                          child: Text("Third Item"),
                          value: 3
                          ),
                          DropdownMenuItem(
                          child: Text("Fourth Item"),
                          value: 4
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value as int;

                          });
                        }
                      ),
                    /*child: DropdownButton<String>(
                      value: _chosenValue,
                      //elevation: 5,
                      style: TextStyle(color: Colors.black),

                      items: <String>[
                        'Android',
                        'IOS',
                        'Flutter',
                        'Node',
                        'Java',
                        'Python',
                        'PHP',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        "Please choose a langauage",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),

                      ),
                    ),*/
                     /* child: Text("Skill Sets",style: TextStyle(
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w300
                      ),)*/)
              ),
             /* SizedBox(
                height: 10,
              ),
              Text(
                "App Developer || Digital Marketer"
                ,style: TextStyle(
                  fontSize: 18.0,
                  color:Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300
              ),
              ),*/

              Container(

                child: TextField(
                  obscureText: true,
                  style: style,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: InputBorder.none,
                      hintText: "Nom Complet",
                      suffixIcon: Icon(
                        Icons.account_circle_outlined,
                      )
                  ),


                ),
              ),
              SizedBox(height: 20.0),
              Container(

                child: TextField(
                  obscureText: true,
                  style: style,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: InputBorder.none,
                      hintText: "Email",
                      suffixIcon: Icon(
                        Icons.email_outlined,
                      )),
                ),
              ),

              SizedBox(
              height: 15.0,
              ),

              Text(
              /*"+2250103718997"*/
              this.username != null?this.username:"",
                style: TextStyle(
              fontSize: 18.0,
              color:Colors.black,
              fontFamily: "MontserratBlack",
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300
              ),

              ),
              SizedBox(
                height: 10.0,
              ),
             /* Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Expanded(
              child: Column(
              children: [
              Text("Tickets",
              style: TextStyle(
              color:Color(0xff2a82c4),
              fontSize: 22.0,
              fontWeight: FontWeight.w600
              ),),
              SizedBox(
              height: 7,
              ),
              Text("15",
              style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w300
              ),)
              ],
              ),
              ),
              Expanded(
              child:
              Column(
              children: [
              Text("Paiements",
              style: TextStyle(
              color:Color(0xff2a82c4),
              fontSize: 22.0,
              fontWeight: FontWeight.w600
              ),),
              SizedBox(
              height: 7,
              ),
              Text("2000",
              style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w300
              ),)
              ],
              ),
              ),
              ],
              ),
              ),
              ),

              SizedBox(
                height: 20,
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Material(
                    color: Color(0xff000000),

                    child: MaterialButton(
                      minWidth: 200,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },

                      child: Text("Continuer",


                            textAlign: TextAlign.center,


                          style: style.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold)
                      ),


                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        )
    );
  }
}