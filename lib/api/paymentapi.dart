import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tike_consumer/Qrcodetiket.dart';
import 'package:xml/xml.dart';
import 'package:xml/xml_events.dart';

import 'package:tike_consumer/model/PaymentTransaction.dart';
import 'package:tike_consumer/model/ResultResult.dart';
import 'package:xml2json/xml2json.dart'; // add this line
import 'package:http/http.dart' as http;

import '../PaymentType.dart';
class PaymentTransactionApi {
  /*final String  url ="https://tabiz.cs4africa.com/schooldemo/Authentication/Login/Submit" ;*/
  final String  url ="https://secure.3gdirectpay.com/API/V6/" ;

  String autorisation="";
  String id ="";

  Xml2Json xml2json = new Xml2Json();
  Xml2Json xml2json2 = new Xml2Json(); //Make an instance.
String PaymentAmount = "5";
String PaymentCurrency ="kes";
String PaymentNumber = "+254725294227";
  /*Future<ResultResult>*/
  FinalPaymentTransactionAPI (String TransactionToken) async {


    final bookshelfXml2 = '''<?xml version="1.0" encoding="UTF-8"?>
<API3G>
   <CompanyToken>9F416C11-127B-4DE2-AC7F-D5710E4C5E0A</CompanyToken>
   <Request>ChargeTokenMobile</Request>
   <TransactionToken>'''+TransactionToken+'''</TransactionToken>
   <PhoneNumber>'''+PaymentNumber+'''</PhoneNumber>
   <MNO>mpesa</MNO>
   <MNOcountry>kenya</MNOcountry>
</API3G>
''';

    try {
      http.Response response2 = await http.post(
        Uri.parse(url),
        headers: {'Content-type': 'text/xml'},
        body: bookshelfXml2,
      );
      xml2json2.parse(response2.body);
      /*    var jsondata = xml2json.toGData();
      var data = jsonDecode(jsondata);
      print(data);*/
      var jsonString2 = xml2json2.toParker();
      var data2 = jsonDecode(jsonString2);
      print(bookshelfXml2);
      print(data2['API3G']);
      MaterialPageRoute(builder: (context) => QrCode());

    } catch(e){
      MaterialPageRoute(builder: (context) => QrCode());

    /*print("problem");*/

  }


  }

  PaymentAPISendgetTransToken () async{

    final bookshelfXml = '''<?xml version="1.0"?>
   <API3G>
  <CompanyToken>9F416C11-127B-4DE2-AC7F-D5710E4C5E0A</CompanyToken>
<Request>createToken</Request>
<Transaction>
<PaymentAmount>'''+PaymentAmount+'''</PaymentAmount>
<PaymentCurrency>'''+PaymentCurrency+'''</PaymentCurrency>
<CompanyRef>49FKEOA</CompanyRef>
<RedirectURL>http://www.domain.com/payurl.php</RedirectURL>
<BackURL>http://www.domain.com/backurl.php </BackURL>
<CompanyRefUnique>0</CompanyRefUnique>
<PTL>5</PTL>
</Transaction>
<Services>
  <Service>
    <ServiceType>3854</ServiceType>
    <ServiceDescription>Test Product</ServiceDescription>
    <ServiceDate>2021/03/04 14:00</ServiceDate>
  </Service>


</Services>
</API3G>''';
    final document = XmlDocument.parse(bookshelfXml);

/*    print(json.encode( laymentTransaction.toJson()  )) ;*/
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-type': 'text/xml'},

          body: bookshelfXml
      );

      xml2json.parse(response.body);
      var jsonString = xml2json.toParker();
      var data = jsonDecode(jsonString);
      String valeur = data['API3G']['TransToken'];
      await FinalPaymentTransactionAPI(valeur);

      return   response.statusCode == 401 ? data : data;
    } catch(e){

    }
  }


}