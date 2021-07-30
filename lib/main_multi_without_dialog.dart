import 'package:flutter/material.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
// import 'package:example/main_single_without_dialog.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:jiffy/jiffy.dart';
import 'package:tike_consumer/some_calendar.dart';

import 'TicketsDetailsEvent.dart';


class MainMultiWithoutDialog extends StatefulWidget {
  final String title;
  final String id;
  final String promocode ;
  final String code;

  MainMultiWithoutDialog({this.id,  this.promocode , this.title, this.code}) ;
  @override
  _MainMultiWithoutDialogState createState() => _MainMultiWithoutDialogState(CodePromo : this.promocode, TitlePage : this.title, Id : this.id, code: this.code);
}



class _MainMultiWithoutDialogState extends State<MainMultiWithoutDialog>{
  final String CodePromo ;
  final String TitlePage;
  final String Id;
  final String code;

  _MainMultiWithoutDialogState({this.CodePromo,this.TitlePage,this.Id, this.code});
  /* List<DateTime> selectedDates = List();*/
  List<DateTime> selectedDates = [DateTime(2021, 7, 24, 18),DateTime(2021, 7, 25, 9),DateTime(2021, 7, 26, 8),
    DateTime(2021, 7, 27, 16),DateTime(2021, 7, 28, 12),DateTime(2021, 7, 28, 12)];
   List _elements = <Element>[
     Element(DateTime(2021, 7, 24, 18), 'Click here to Buy your ticket', Icons.payment),
     Element(DateTime(2021, 7, 25, 9),  'Click here to Buy your ticket', Icons.payment),
     Element(DateTime(2021, 7, 26, 8),  'Click here to Buy your ticket', Icons.payment),
   Element(DateTime(2021, 7, 27, 16),  'Click here to Buy your ticket', Icons.payment),
  Element(DateTime(2021, 7, 28, 20),  'Click here to Buy your ticket', Icons.payment),
  Element(DateTime(2021, 7, 28, 12),  'Click here to Buy your ticket', Icons.payment),

   ];


  final _scaffoldKey = GlobalKey<ScaffoldState>();
   @override
   void initState() {
     initializeDateFormatting();
     Intl.systemLocale =
     'en_En'; // to change the calendar format based on localization
     super.initState();
   }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        key: _scaffoldKey,
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_outlined),
            title: Text('Calendar Page'),
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

        body: StickyGroupedListView<Element, DateTime>(
          elements: _elements,
          order: StickyGroupedListOrder.ASC,
          groupBy: (Element element) =>
              DateTime(element.date.year, element.date.month, element.date.day),
          groupComparator: (DateTime value1, DateTime value2) =>
              value2.compareTo(value1),
          itemComparator: (Element element1, Element element2) =>
              element1.date.compareTo(element2.date),
          floatingHeader: true,
          groupSeparatorBuilder: (Element element) => Container(
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  border: Border.all(
                    color: Colors.blue[300],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${element.date.day}. ${element.date.month}, ${element.date.year}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          itemBuilder: (_, Element element) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                child: ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),


                  leading: new GestureDetector(
                    onTap: () {
                      if (this.code=="2"){
                        Navigator.of(context).push(MaterialPageRoute(

                            builder: (c) => TicketsDetailsEvent(id: "1" , promocode: this.CodePromo,title: ""))
                        );
                      }else if(this.code=="1"){
                        Navigator.of(context).push(MaterialPageRoute(

                            builder: (c) => TicketsDetailsTransport(id: "1" , promocode: this.CodePromo ,title: ""))
                        );
                      }


                        /*TicketsDetailsEvent(id: "1" , promocode: "",title: ""))*/

                    /*  if(this.CodePromo=="2"){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => TicketsDetailsTransport(id: "1" , promocode: "0000",title: ""))

                          *//*TicketsDetailsEvent(id: "1" , promocode: "",title: ""))*//*
                        );
                      }else if(this.CodePromo=="1"){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => TicketsDetailsTransport(id: "1" , promocode: "0000",title: "")),

                          *//*TicketsDetailsTransport(id: "1" , promocode: "",title: ""))*//*
                        );



                      }*/
                    },
                    child: new Icon(element.icon),
                  ),
                  title:
                  new GestureDetector(
                    onTap: () {
                      if (this.code=="2"){
                        Navigator.of(context).push(MaterialPageRoute(

                            builder: (c) => TicketsDetailsEvent(id: "1" , promocode: this.CodePromo,title: ""))
                        );
                      }else if(this.code=="1"){
                        Navigator.of(context).push(MaterialPageRoute(

                            builder: (c) => TicketsDetailsTransport(id: "1" , promocode: this.CodePromo ,title: ""))
                        );
                      }
                    /*  if(this.CodePromo=="2"){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => TicketsDetailsTransport(id: "1" , promocode: "0000",title: ""))

                          *//*TicketsDetailsEvent(id: "1" , promocode: "",title: ""))*//*
                        );
                      }else if(this.CodePromo=="1"){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => TicketsDetailsTransport(id: "1" , promocode: "0000",title: "")),

                          *//*TicketsDetailsTransport(id: "1" , promocode: "",title: ""))*//*
                        );



                      }*/
                    },
                    child: new Text(element.name),
                  ),
                  trailing:
                  new GestureDetector(
                    onTap: () {
                      if (this.code=="2"){
                        Navigator.of(context).push(MaterialPageRoute(

                            builder: (c) => TicketsDetailsEvent(id: "1" , promocode: this.CodePromo ,title: ""))
                        );
                      }else if(this.code=="1"){
                        Navigator.of(context).push(MaterialPageRoute(

                            builder: (c) => TicketsDetailsTransport(id: "1" , promocode: this.CodePromo ,title: ""))
                        );
                      }
                   /*   if(this.CodePromo=="2"){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => TicketsDetailsTransport(id: "1" , promocode: "0000",title: ""))

                          *//*TicketsDetailsEvent(id: "1" , promocode: "",title: ""))*//*
                        );
                      }else if(this.CodePromo=="1"){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => TicketsDetailsTransport(id: "1" , promocode: "0000",title: "")),

                          *//*TicketsDetailsTransport(id: "1" , promocode: "",title: ""))*//*
                        );



                      }*/
                    },
                    child: new /*Text('${element.date.hour}:00'),*/ Text(this.CodePromo)
                  ),
                ),
              ),
            );
          },
        ),

      bottomNavigationBar:  Container(
          child: Row(
              children: <Widget>[

                SizedBox(
                  height: 40,
                ),
                SomeCalendar(
                  primaryColor: Color(0xff5833A5),
                  mode: SomeMode.Multi,
                  isWithoutDialog: true,
                  selectedDates: selectedDates,
                  startDate: Jiffy().subtract(years: 3),
                  lastDate: Jiffy().add(months: 9),
                  done: (date) {
                    setState(() {
                      selectedDates = date;
                      showSnackbar(selectedDates.toString());
                    });
                  },
                ),

              ]
          ),
        )

      /*  SomeCalendar(
          primaryColor: Color(0xff5833A5),
          mode: SomeMode.Multi,
          isWithoutDialog: true,
          selectedDates: selectedDates,
          startDate: Jiffy().subtract(years: 3),
          lastDate: Jiffy().add(months: 9),
          done: (date) {

          },
        ),*/



      ),

    );
  }

  void showSnackbar(String x) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(x),
    ));
  }
}

class Element {
  DateTime date;
  String name;
  IconData icon;

  Element(this.date, this.name, this.icon);
}