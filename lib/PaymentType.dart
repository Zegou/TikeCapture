import 'package:flutter/material.dart';
import 'package:tike_consumer/api/paymentapi.dart';
import 'package:tike_consumer/model/RegisterResponse.dart';

import 'Qrcodetiket.dart';



class PaymentType extends StatefulWidget {
  @override
  _PaymentTypePageState createState() => _PaymentTypePageState();
}

class _PaymentTypePageState extends State<PaymentType> {

  bool _isloading = false ;
  PaymentTransactionApi paymentTransactionApi = new PaymentTransactionApi();

  Future<void> _submitgetTransToken() async{
    setState(() {
      _isloading = true ;
    });





    try {
      await paymentTransactionApi.PaymentAPISendgetTransToken(/*paymentTransaction: paymentTransactionModel*/).then((value) {
          if (value is RegisterResponse) {

            print(value.message);


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

  final titles = ['Mpesa', 'Visa Carte', 'Orange Money', 'MTN Money',
    'MOOV Money', 'BANK Transfert'];

  final ImageLink = ["assets/images/mpesa-logo.png", "assets/images/visa.png",
    "assets/images/orange.png", "assets/images/mtn.png", "assets/images/moov-money.png",
    "assets/images/bank_transfert.png"];


  @override
  Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Payment page',
            home: Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.arrow_back_outlined),
                title: Text('Moyens de paiement'),
                actions: [

                  Icon(Icons.more_vert),
                ],
                backgroundColor: Colors.black,
              ),
            body:    ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {


                      return Card( //
                          child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: ListTile(
                                leading: Image.asset(ImageLink[index]),
                                title: Text(titles[index]),
                                trailing: _isloading ?

                                Center(child: CircularProgressIndicator(),) : InkWell(

                                    child: Icon(Icons.keyboard_arrow_right),
                                    onTap: ()=> {
                                    Navigator.of(context).push(MaterialPageRoute(

                                    builder: (c) => QrCode())
                                    ),

                                      }


                                )

                      )
                      )
                      );









                    }


                )


           /* ListView(
            children: [
      *//*        for (int count in List.generate(9, (index) => index + 1))*//*
                ListTile(
                  title: InkWell(
                    child: Text("Mpesa"),
                    onTap: _submitgetTransToken
                  ),
                  leading:  InkWell(
                    child: Image.asset('assets/images/mpesa-logo.png',
                        height: 150,
                        fit:BoxFit.fill),
                    onTap: _submitgetTransToken,
                  ),

                ),

            Center(
                  child:
                  _isloading ?
                  Center(child: CircularProgressIndicator(),) :
                  Center(child: Text(""),)
              ),
            ],
          ),*/
            )


    );
  }
}

class BodyLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {


  final titles = ['Mpesa', 'Visa Carte', 'Orange Money', 'MTN Money',
    'MOOV Money', 'BANK Transfert'];

  final ImageLink = ["assets/images/mpesa-logo.png", "assets/images/mpesa-logo.png",
    "assets/images/mpesa-logo.png", "assets/images/mpesa-logo.png", "assets/images/mpesa-logo.png",
    "assets/images/mpesa-logo.png"];

  return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {


        return Card( //
           child: Padding(
            padding: EdgeInsets.all(5.0),
              child: ListTile(
                leading: Image.asset(ImageLink[index]),
                title: Text(titles[index]),
                trailing: InkWell(
                  child: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    if (index == 0) {

                    }
                  }
                ),


              )
            )
          );





}


);
}
