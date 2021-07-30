import 'package:flutter/material.dart';
import 'package:tike_consumer/api/paymentapi.dart';
import 'package:tike_consumer/calendar_day.dart';
import 'package:tike_consumer/cienma_seat.dart';
import 'package:tike_consumer/model/PaymentTransaction.dart';
import 'package:tike_consumer/model/ResultResult.dart';
import 'package:tike_consumer/show_time.dart';
import 'package:xml2json/xml2json.dart'; // add this line


import 'PaymentType.dart';
import 'const.dart';
import 'model/PaymentTransaction.dart';
import 'model/PaymentTransaction.dart';
class TicketsDetailsEvent extends StatelessWidget {
  final String title;
  final String id;
  final String promocode ;

  TicketsDetailsEvent({this.id,  this.promocode , this.title}) ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:15.0 , left:15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .12,
                    height: MediaQuery.of(context).size.width * .12,
                    decoration: kRoundedFadedBorder,
                    child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: 28.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      CalendarDay(
                        dayNumber: '9',
                        dayAbbreviation: 'TH',
                      ),
                      CalendarDay(
                        dayNumber: '10',
                        dayAbbreviation: 'FR',
                      ),
                      CalendarDay(
                        dayNumber: '11',
                        dayAbbreviation: 'SA',
                      ),
                      CalendarDay(
                        dayNumber: '12',
                        dayAbbreviation: 'SU',
                        isActive: true,
                      ),
                      CalendarDay(
                        dayNumber: '13',
                        dayAbbreviation: 'MO',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ShowTime(
                    time: '11:00',
                    price: 5,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: true,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.tv,
                    color: kPimaryColor,
                    size: 25.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Star Cineplex Bangladesh', style: kMainTextStyle),
                      Text('panthapath , 1205 Dhaka, Bangladesh',
                          style:
                          TextStyle(color: Colors.white30, fontSize: 15.0)),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Text('2D', style: kMainTextStyle),
                          SizedBox(width: 10.0),
                          Text('3D',
                              style: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 20.0),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                    color: Colors.white38,
                  )
                ],
              ),
            ),
            Center(child: Image.asset('assets/images/screen.png')),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  // First Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        isReserved: true,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                    ],
                  ),
                  // Third  Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(
                        isReserved: true,
                      ),
                      CienmaSeat(
                        isReserved: true,
                      ),
                    ],
                  ),
                  // 4TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        isReserved: true,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                    ],
                  ),
                  // 5TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                    ],
                  ),
                  // 6TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                    ],
                  ),
                  // final Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      '30\$',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:40.0 , vertical:10.0),
                    decoration: BoxDecoration(color:  kActionColor , borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0))),
                    child: InkWell(child: Text('Pay' , style: TextStyle(color: Colors.white ,fontSize: 25.0 , fontWeight:FontWeight.bold))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class TicketsDetailsTransport extends StatelessWidget {
  final String title;
  final String id;
  final String promocode ;

  const TicketsDetailsTransport({Key key, this.title, this.id, this.promocode}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool _isloading = false ;
    // Api for Transaction
    PaymentTransactionApi paymentTransactionApi = new PaymentTransactionApi();

    // Model Api for Transaction
    PaymentTransaction paymentTransactionModel = PaymentTransaction() ;
    apiGTransaction  apigTransaction  = new apiGTransaction();
    Service service = new Service();
    Transaction transaction = new Transaction();

    // Class For Result
    ResultResult _ResultResultApi = ResultResult() ;

    Future<void> _submitgetTransToken() async{


      // if (!_formKey.currentState.validate()) {
      //   return;
      // }

/*      apigTransaction.companyToken ="9F416C11-127B-4DE2-AC7F-D5710E4C5E0A" ;
      apigTransaction.request = "createToken";

      transaction.paymentAmount = 450;
      transaction.paymentCurrency = "USD";
      transaction.companyRef = "49FKEOA";
      transaction.companyRefUnique=0;
      transaction.redirectUrl="http://www.domain.com/payurl.php";
      transaction.backUrl="http://www.domain.com/backurl.php";
      transaction.companyRefUnique=0;
      transaction.ptl=5;

      service.serviceType=45;
      service.serviceDate ="2013/12/20 19:00";
      service.serviceDescription ="Flight from Nairobi to Diani";*/




      try {

        await paymentTransactionApi.PaymentAPISendgetTransToken().then((value) {


        });

      } catch (e) {
        print(e);

      }

    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment page',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: this.title , id: this.id, promocode: this.promocode),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final String id;
  final String promocode ;

  MyHomePage({Key key, this.title , this.id, this.promocode}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState(title: this.title , id: this.id, promocode: this.promocode);
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isloading = false ;
  // Api for Transaction
   PaymentTransactionApi paymentTransactionApi = new PaymentTransactionApi();

   // Model Api for Transaction
  PaymentTransaction paymentTransactionModel = PaymentTransaction() ;
  apiGTransaction  apigTransaction  = new apiGTransaction();
  Service service = new Service();
  Transaction transaction = new Transaction();

   // Class For Result
  ResultResult _ResultResultApi = ResultResult() ;

  Future<void> _submitgetTransToken() async{
   setState(() {
      _isloading = true ;
    });




   try {
        await paymentTransactionApi.PaymentAPISendgetTransToken().then((value) {
          if (value is ResultResult) {

            print(ResultResult);


          } else {
            print("problème lors de envoi");

          }
        });
       setState(() {
          _isloading = false;
        });
      } catch (e) {
        print(e);
       setState(() {
          _isloading = false;
        });
      }

  }


  String title;
  String id;
  String promocode ;

  _MyHomePageState({this.title , this.id, this.promocode});

  int _counter = 0;
   int finalprice = 0 ;
   int _unitprice = 80;


   int CardTotal = 0 ;
   int DiscountAmount = 0 ;
   int Subtotal = 0 ;



  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
      finalprice = _counter * _unitprice ;

      CardTotal = finalprice;
      DiscountAmount = (int.parse(this.promocode) *CardTotal)~/100;
      Subtotal = CardTotal + DiscountAmount;
    });
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      finalprice = _counter * _unitprice ;

      CardTotal = finalprice;
      DiscountAmount = (int.parse(this.promocode) *CardTotal)~/100;
      Subtotal = CardTotal + DiscountAmount;

    });
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment page',
      home: Scaffold(
          appBar: AppBar(
            // TODO: Add buttons and title (102)

            leading: IconButton(

              icon:Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed:(){
                setState(() {
                  //set not searching on back button press
                });
              },
            ),

            //if searching is true then show arrow back else play arrow
            backgroundColor: Colors.black,


            //if searching set background to orange, else set to deep orange
          ),
        body: SafeArea(
          child: SingleChildScrollView(

              child: new Material(
                  color: Colors.white,

                  child :Column(
                      children: <Widget>[
                        Padding(

                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
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
                                              Text("WHAT TICKETS DO YOU LIKE?",style: TextStyle(fontFamily: "MontserratSemiBold", fontSize: 18 , color :Colors.black26),)
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAlias,

                                    child: Row(
                                      children: [

                                        Expanded(
                                            flex: 2, // 20%

                                            child: Container(
                                              padding: const EdgeInsets.all(25.0)
                                              ,color: Colors.black12,
                                              child: Text("0", style: TextStyle(fontFamily: "MontserratRegular",fontSize: 50)),
                                            )

                                        ),
                                        Expanded(
                                          flex: 8, // 60%
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child : Container(
                                                padding: EdgeInsets.only(left: 40),
                                                child: Column(
                                                    children: [
                                                      Text("Normal Ticket",style: TextStyle(fontFamily: "MontserratSemiBold", fontSize: 16 , color :Colors.black54), textAlign: TextAlign.left),
                                                      SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text("4:30 PM until 6:30PM" ,style: TextStyle(fontFamily: "MontserratRegular", fontSize: 13 , color :Colors.black26), textAlign: TextAlign.left),
                                                      SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text("Sold out" ,style: TextStyle(fontFamily: "MontserratRegular", fontSize: 13 , color :Color(0xffba1818)), textAlign: TextAlign.left),

                                                    ]
                                                ),
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAlias,

                                    child: Row(
                                      children: [

                                        Expanded(
                                            flex: 2, // 20%

                                            child: Container(
                                              padding: const EdgeInsets.all(25.0)
                                              ,color: Colors.black12,
                                              child: Text("$_counter", style: TextStyle(fontFamily: "MontserratRegular",fontSize: 50)),
                                            )

                                        ),
                                        Expanded(
                                          flex: 6, // 60%
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child : Container(
                                                padding: EdgeInsets.only(left: 40),
                                                child: Column(
                                                    children: [
                                                      Text("Vip Ticket",style: TextStyle(fontFamily: "MontserratSemiBold", fontSize: 16 , color :Colors.black54), textAlign: TextAlign.left),
                                                      SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text("4:30 PM until 6:30PM" ,style: TextStyle(fontFamily: "MontserratRegular", fontSize: 13 , color :Colors.black26), textAlign: TextAlign.left),
                                                      SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text("x 80\$ = $finalprice\$" ,style: TextStyle(fontFamily: "MontserratRegular", fontSize: 13 , color :Color(0xffba1818)), textAlign: TextAlign.left),

                                                    ]
                                                ),
                                              )
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2, // 20%
                                            child : Column(
                                                children: [
                                                  Row(
                                                      children: [
                                                        Container(
                                                          color: Colors.white10,
                                                          child : new GestureDetector(
                                                              onTap: _incrementCounter,
                                                              child: Icon(Icons.add)

                                                          ), /*Text("+" ,style: TextStyle(fontFamily: "MontserratBold", fontSize: 30 , color :Color(0xffba1818))    , textAlign:TextAlign.center)*/

                                                        )

                                                      ]),
                                                  Row(
                                                      children: [
                                                        Container(
                                                            color: Colors.white10,
                                                            child : new GestureDetector(
                                                              onTap: _decrementCounter,
                                                              child: Icon(Icons.minimize_rounded)

                                                            )

                                                        ),
                                                      ])


                                                ]
                                            )

                                        )
                                      ],
                                    ),
                                  ),
                                ]
                            )
                        )
                      ]
                  )
              )
          ),
          /*Text(data[index], style: TextStyle(fontFamily: "MontserratRegular"),)*/
        ),
        bottomNavigationBar: orderDetail(context,this.promocode) // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }



  Widget orderDetail(BuildContext context , String promocode) {
    return Container(
      height: 200.0,
      margin: EdgeInsets.only(top: 25.0, bottom: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Card Total",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\u20B9 $CardTotal",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),


          Container(
              child : Column(
                children: [

                  // On déclare un if en fonction du code Promo
                  if ((promocode == "")|| (promocode == null)) ...[

                  ] else ...[
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Discount  ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$DiscountAmount",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ],
              )

          ),




          /*      SizedBox(
            height: 13.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tax",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "3.0",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),*/
          Divider(
            height: 40.0,
            color: Color(0xFFD3D3D3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Sub Total",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "$Subtotal",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          // ListTile(
          //   leading: Text("Card Total",style: TextStyle(color: Colors.grey,fontSize: 16.0,fontWeight: FontWeight.bold),),
          //   trailing: Text("33.0",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
          // ),
          SizedBox(
            height: 24.0,
          ),
          InkWell(
            onTap: () =>  {

            }
/*
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SignInPage()));
*/
             ,
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30.0),
              ),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(

                      child: Center(
                          child:
                          _isloading ?
                          Center(child: CircularProgressIndicator(),) :
                          RaisedButton(
                              color: Colors.black,
                              child: Text("Proceed to CheckOut",style: TextStyle(color: Colors.white),),
                              onPressed:() =>/* _submitgetTransToken() */{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PaymentType()),
                                ),
                              }
                          )
                      ),
                    )
                )
              /*child: Center(
                child:
                _isloading ?
                Center(child: CircularProgressIndicator(),) :
                RaisedButton(
                    color: Colors.black,
                    child: Text("Proceed to CheckOut",style: TextStyle(color: Colors.white),),
                    onPressed: _submitgetTransToken
                )
                *//*child: Text(
                  "Proceed to CheckOut",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )*//*,


              ),*/
            ),
          ),
        ],
      ),
    );
  }
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
        child: Container(
            color:Colors.white10 ,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.white,        // Tab Bar color change
                    child: _tabBar,
                  )
                ]
            )

        )

    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

/// Implementation

class CustomTabView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final IndexedWidgetBuilder pageBuilder;
  final Widget stub;
  final ValueChanged<int> onPositionChange;
  final ValueChanged<double> onScroll;
  final int initPosition;

  CustomTabView({
    @required this.itemCount,
    @required this.tabBuilder,
    @required this.pageBuilder,
    this.stub,
    this.onPositionChange,
    this.onScroll,
    this.initPosition,
  });

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabView> with TickerProviderStateMixin {
  TabController controller;
  int _currentCount;
  int _currentPosition;

  @override
  void initState() {
    _currentPosition = widget.initPosition ?? 0;
    controller = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    );
    controller.addListener(onPositionChange);
    controller.animation.addListener(onScroll);
    _currentCount = widget.itemCount;
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    if (_currentCount != widget.itemCount) {
      controller.animation.removeListener(onScroll);
      controller.removeListener(onPositionChange);
      controller.dispose();

      if (widget.initPosition != null) {
        _currentPosition = widget.initPosition;
      }

      if (_currentPosition > widget.itemCount - 1) {
        _currentPosition = widget.itemCount - 1;
        _currentPosition = _currentPosition < 0 ? 0 :
        _currentPosition;
        if (widget.onPositionChange is ValueChanged<int>) {
          WidgetsBinding.instance.addPostFrameCallback((_){
            if(mounted) {
              widget.onPositionChange(_currentPosition);
            }
          });
        }
      }

      _currentCount = widget.itemCount;
      setState(() {
        controller = TabController(
          length: widget.itemCount,
          vsync: this,
          initialIndex: _currentPosition,
        );
        controller.addListener(onPositionChange);
        controller.animation.addListener(onScroll);
      });
    } else if (widget.initPosition != null) {
      controller.animateTo(widget.initPosition);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.animation.removeListener(onScroll);
    controller.removeListener(onPositionChange);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount < 1) return widget.stub ?? Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).hintColor,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
            tabs: List.generate(
              widget.itemCount,
                  (index) => widget.tabBuilder(context, index),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: List.generate(
              widget.itemCount,
                  (index) => widget.pageBuilder(context, index),
            ),
          ),
        ),
      ],
    );
  }

  onPositionChange() {
    if (!controller.indexIsChanging) {
      _currentPosition = controller.index;
      if (widget.onPositionChange is ValueChanged<int>) {
        widget.onPositionChange(_currentPosition);
      }
    }
  }

  onScroll() {
    if (widget.onScroll is ValueChanged<double>) {
      widget.onScroll(controller.animation.value);
    }
  }
}