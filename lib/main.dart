import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tike_consumer/src/themes/light_color.dart';
import 'package:tike_consumer/tab_screen.dart';
import 'constants/Theme.dart';
import 'package:tike_consumer/navigationDrawer.dart';
import 'CardSmall.dart';
import 'package:flutter/widgets.dart';
import 'package:tike_consumer/EventDetails.dart';
import 'package:tike_consumer/model/EventListResponse.dart';

import 'package:http/http.dart' as http;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  final int user_id;
  final String username ;
  final String autorization ;

  HomePage({this.user_id, this.username, this.autorization});

  @override
  State<StatefulWidget> createState() {
    return _HomeState(user_id: user_id , username: username , autorization : autorization);
  }
}

class _HomeState extends State<HomePage> {

  int user_id;
  String username ;
  String autorization ;

  _HomeState({this.user_id, this.username, this.autorization});


  TextEditingController searchController = new TextEditingController();

   Function getCurrentPage ;
  TextStyle style = TextStyle(fontFamily: 'MontserratBold');
   Color color;
   double elevationvalue ;
  TextStyle style2 = TextStyle(fontFamily: 'spacegroteskbold' , fontSize: 17);
  TextStyle styleColor = TextStyle(fontFamily: 'MontserratRegular', color: Colors.white);

  bool searching, error;
  var data;
   String query;

  String dataurl = "https://3ce-ci.com/flutter_login/search_suggestion.php";
  int _currentIndex = 0;




  /* final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.black26)
  ];*/



  @override
  void initState() {
    searching = false;
    error = false;
    query = "";
    color = Colors.transparent;
    super.initState();
    this.data = data;

  }

  void getSuggestion() async{  //get suggestion function
    var res = await http.post(Uri.parse(dataurl + "?query=" + query));
    //in query there might be unwant character so, we encode the query to url
    if (res.statusCode == 200) {
      setState(() {
        data = json.decode(res.body);
        //update data value and UI
      });
    }else{
      //there is error
      setState(() {
        error = true;
      });
    }
  }

  Widget build(BuildContext context) {
    const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[

      Container(
          child:data == null?
          _myListView(context , color)

              :
          Container(
            child: searching?showSearchSuggestions()
                :
            _myListView(context , color) != null
                ?_myListView(context , color): Center(child: CircularProgressIndicator()),
          )
      ),
      Text(
        'Index 2: Catégories',
        style: optionStyle,
      ),
      Text(
        'Index 3: School',
        style: optionStyle,
      ),
      Container(

          child: Profile()
      ),
    ];
    return Scaffold(
      appBar: AppBar(
// TODO: Add buttons and title (102)

        leading: searching?IconButton(

          icon:Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed:(){
            setState(() {
              searching = false;
              //set not searching on back button press
            });
          },
        ):Icon(Icons.account_circle_outlined, color: Colors.white),


        //if searching is true then show arrow back else play arrow
        title:searching?searchField():Text("select Event",style: styleColor,),

        actions: [
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed:(){
                setState(() {
                  searching = true;
                });
              }
          ), // search icon button

          //add more icons here
        ],
        backgroundColor: searching?Colors.black:Colors.black,


        //if searching set background to orange, else set to deep orange
      ),

      drawer: navigationDrawer(),
      body:Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:_widgetOptions[_currentIndex],

          )
      ) ,

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.black,


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outlined),
            title: Text('Manage Event'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile',)
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  Widget showSearchSuggestions(){
    List suggestionlist = List.from(
        data["data"].map((i){
          return SearchSuggestion.fromJSON(i);
        })
    );
    //serilizing json data inside model list.
    return Column(
      children:suggestionlist.map((suggestion){
        return InkResponse(
            onTap: (){
              //when tapped on suggestion
              print(suggestion.id); //pint student id
            },
            child: SizedBox(
                width:double.infinity, //make 100% width
                child:Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(suggestion.name, style: TextStyle(
                      fontSize:20, fontWeight:FontWeight.bold,
                    ),),
                  ),
                )
            )
        );
      }).toList(),
    );
  }

  Widget searchField(){ //search input field
    return Container(
        child:TextField(
            autofocus: true,
            style: TextStyle(color:Colors.white, fontSize: 18),
            decoration:InputDecoration(
              hintStyle: TextStyle(color:Colors.white, fontSize: 18),
              hintText: "Search City",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:Colors.white, width:2),
              ),//under line border, set OutlineInputBorder() for all side border
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:Colors.white, width:2),
              ), // focused border color
            ), //decoration for search input field
            onChanged: (value) {
              query = value; //update the value of query
              getSuggestion(); //start to get suggestion          },
            })
    );
  }

  void bodydisplay(){


    ListView(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title: const Text('Card title 1'),
                subtitle: Text(
                  'Secondary Text',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('ACTION 1'),
                  ),
                  FlatButton(
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('ACTION 2'),
                  ),
                ],
              ),
              Image.asset('assets/images/card-sample-image.jpg'),
            ],
          ),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title: const Text('Card title 1'),
                subtitle: Text(
                  'Secondary Text',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('ACTION 1'),
                  ),
                  FlatButton(
                    onPressed: () {
                      // Perform some action
                    },
                    child: const Text('ACTION 2'),
                  ),
                ],
              ),
              Image.asset('assets/images/card-sample-image-2.jpg'),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _myListView(BuildContext context , Color color) {
  TextStyle style = TextStyle(fontFamily: 'MontserratBold');
  color = Colors.transparent;
  TextStyle style2 = TextStyle(fontFamily: 'MontserratRegular' , fontSize: 17);

  return Scaffold(
    backgroundColor: Colors.white10,
    body: DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {

          return <Widget>[

            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(

                  TabBar(
                          labelColor: Colors.black87,
                          labelStyle: TextStyle(fontFamily: "MontserratRegular"),
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(/*icon: Icon(Icons.add_circle_outline), */text: "Transport"),
                            Tab( text: "Event"),
                            Tab( text: "Payments"),
                          ],
                        ),
              ),
              pinned: true,
            ),
          ];
        },
        body: new TabBarView(

          children: <Widget>[

            new Card(

              child: InkWell(

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventDetails(id: "1", title: "EventDetails",code: "1")),
                  );
                },



                  child: ListView(

                  children: [
                   Card(
                  /* clipBehavior: Clip.antiAlias,*/
                  elevation: 0.0,
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
                              'assets/images/transport.png',
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
                                        Text("          "),
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
                                  'Greyhound divisively hello coldly dff.',
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
                                      ]),
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
                  SizedBox(
                    height: 30.0,
                  ),
                    Card(
                      /* clipBehavior: Clip.antiAlias,*/
                      elevation: 0.0,
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
                                'assets/images/transport.png',
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
                                          Text("          "),
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
                                    'Greyhound divisively hello coldly dff.',
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
                                        ]),
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
                  ],

                ),




              ),

            ),
            new Card(

              child: InkWell(

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventDetails(id: "2", title: "EventDetails",code: "2")),
                  );
                },



                child: ListView(

                  children: [

                    Card(
                      /* clipBehavior: Clip.antiAlias,*/
                      elevation: 0.0,
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
                                'assets/images/music.png',
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
                                          Text("          "),
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
                                    'Greyhound divisively hello coldly dff.',
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
                                        ]),
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
                    SizedBox(
                      height: 30.0,
                    ),
                    Card(
                      /* clipBehavior: Clip.antiAlias,*/
                      elevation: 0.0,
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
                                          Text("          "),
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
                                    'Greyhound divisively hello coldly dff.',
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
                                        ]),
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
                  ],

                ),




              ),

            ),
            new TabScreen("Payments"),

          ],
        ),

      ),
    ),
  );
}
/*Widget HomeSapceList (BuildContext context , Color color){
  _myListView(context,color);
}*/
Widget Profile(){
  return Stack(children: <Widget>[

    Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("assets/images/profile-screen-avatar.jpg"),
                fit: BoxFit.fitWidth),
        )),
    SafeArea(
      child: ListView(children: [
        Padding(
          padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 74.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset:
                        Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: .0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 85.0, bottom: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: ArgonColors.info,
                                          borderRadius:
                                          BorderRadius.circular(3.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.0),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          "TICKETS",
                                          style: TextStyle(
                                              color: ArgonColors.white,
                                              fontSize: 12.0,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                            vertical: 8.0),
                                      ),
                                      SizedBox(
                                        width: 30.0,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: ArgonColors.initial,
                                          borderRadius:
                                          BorderRadius.circular(3.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          "PAIEMENTS",
                                          style: TextStyle(
                                              color: ArgonColors.white,
                                              fontSize: 12.0,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                            vertical: 8.0),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 40.0),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text("1",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      82, 95, 127, 1),
                                                  fontSize: 20.0,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("Spectacle",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      50, 50, 93, 1),
                                                  fontSize: 12.0))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("10",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      82, 95, 127, 1),
                                                  fontSize: 20.0,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("Bus",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      50, 50, 93, 1),
                                                  fontSize: 12.0))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("89",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      82, 95, 127, 1),
                                                  fontSize: 20.0,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          Text("Nouveautés",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      50, 50, 93, 1),
                                                  fontSize: 12.0))
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 40.0),
                                  Align(
                                    child: Text("Zegou Hauraud " + " " + "Armel" + "",
                                        style: TextStyle(
                                            fontFamily: "MontserratRegular",
                                            color: Color.fromRGBO(
                                                50, 50, 93, 1),
                                            fontSize: 20.0)),
                                  ),
                                  SizedBox(height: 10.0),
                                  Align(
                                    child: Text("0747289879",
                                        style: TextStyle(
                                            fontFamily: "MontserratLight",
                                            color: Color.fromRGBO(
                                                50, 50, 93, 1),
                                            fontSize: 18.0,

                                            fontWeight: FontWeight.w200)),
                                  ),
                                  Divider(
                                    height: 40.0,
                                    thickness: 1.5,
                                    indent: 32.0,
                                    endIndent: 32.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32.0, right: 32.0),
                                    child: Align(
                                      /*    child: Text(
                                                "An artist of considerable range, Jessica name taken by Melbourne...",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        82, 95, 127, 1),
                                                    fontSize: 17.0,
                                                    fontWeight:
                                                    FontWeight.w200)),*/
                                    ),
                                  ),
                                  SizedBox(height: 15.0),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 25.0, left: 25.0),

                                  ),
                                  /*SizedBox(
                                          height: 250,
                                          child: GridView.count(
                                              primary: false,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24.0,
                                                  vertical: 15.0),
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                              crossAxisCount: 3,
                                              children: <Widget>[
                                                Container(
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              6.0)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://images.unsplash.com/photo-1501601983405-7c7cabaa1581?fit=crop&w=240&q=80"),
                                                          fit: BoxFit.cover),
                                                    )),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.0)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://images.unsplash.com/photo-1543747579-795b9c2c3ada?fit=crop&w=240&q=80hoto-1501601983405-7c7cabaa1581?fit=crop&w=240&q=80"),
                                                          fit: BoxFit.cover),
                                                    )),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.0)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://images.unsplash.com/photo-1551798507-629020c81463?fit=crop&w=240&q=80"),
                                                          fit: BoxFit.cover),
                                                    )),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.0)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?fit=crop&w=240&q=80"),
                                                          fit: BoxFit.cover),
                                                    )),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.0)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://images.unsplash.com/photo-1503642551022-c011aafb3c88?fit=crop&w=240&q=80"),
                                                          fit: BoxFit.cover),
                                                    )),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6.0)),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28?fit=crop&w=240&q=80"),
                                                          fit: BoxFit.cover),
                                                    )),
                                              ]),
                                        )*/
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                FractionalTranslation(
                    translation: Offset(0.0, -0.5),
                    child: Align(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/img/profile-screen-avatar.jpg"),
                        radius: 65.0,
                        // maxRadius: 200.0,
                      ),
                      alignment: FractionalOffset(0.5, 0.0),
                    ))
              ]),
            ],
          ),
        ),
      ]),
    )
  ]);
}

//serarch suggestion data model to serialize JSON data
class SearchSuggestion{
  String id, name;
  SearchSuggestion({ this.id,  this.name});

  factory SearchSuggestion.fromJSON(Map<String, dynamic> json){
    return SearchSuggestion(
      id: json["id"],
      name: json["name"],
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

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    textSelectionColor: shrinePink100,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
      letterSpacing: defaultLetterSpacing,
    ),
    title: base.title.copyWith(
      fontSize: 18,
      letterSpacing: defaultLetterSpacing,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: defaultLetterSpacing,
    ),
    body1: base.body1.copyWith(
      letterSpacing: defaultLetterSpacing,
    ),
    subhead: base.subhead.copyWith(
      letterSpacing: defaultLetterSpacing,
    ),
    display1: base.display1.copyWith(
      letterSpacing: defaultLetterSpacing,
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
  )
      .apply(
    fontFamily: 'Rubik',
    displayColor: shrineBrown900,
    bodyColor: shrineBrown900,
  );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;

