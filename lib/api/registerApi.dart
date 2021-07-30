import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tike_consumer/Login.dart';
import 'package:tike_consumer/l10n/messages_en.dart';
import 'package:tike_consumer/model/RegisterModel.dart';
import 'package:tike_consumer/model/VerificationCodeModel.dart';
import 'package:tike_consumer/model/RegisterResponse.dart';
import 'package:tike_consumer/model/VerificationCodeResponse.dart';

import 'package:http/http.dart' as http;
class RegisterApi {
  /*final String  url ="https://tabiz.cs4africa.com/schooldemo/Authentication/Login/Submit" ;*/
  final String  url ="https://tabiz.cs4africa.com/tike/tike/api_v_1.0/user/create" ;

  String autorisation="";
  int id =0;


  Future<RegisterResponse> Register ({RegisterModel registerModel}) async{
    print(json.encode( registerModel.toJson()  )) ;
    try {
      http.Response response = await http.post(
          Uri.parse(url),
        headers: {'Content-type': 'application/json'},
        body: json.encode( registerModel.toJson() ),
      );
  /*    print('response');
      print(response.body);*/
      autorisation = response.headers['authorization'];
      final data = jsonDecode(response.body);

      toastMessage(data["message"]);

   /*   id = data['\u0024id'];
       print(data["\u0024id"]);*/
      /*int id  = data["\u0024id"];*/



      return  /* response.statusCode == 401 ? (RegisterResponse.fromJson(json.decode(response.body))) :*/ data;
    } catch(e){

    }
  }

/*final String  url ="https://tabiz.cs4africa.com/schooldemo/Authentication/Login/Submit" ;*/
  final String  url2 ="https://tabiz.cs4africa.com/tike/tike/api_v_1.0/user/checkcode" ;

  String autorisation2="";
  String id2 ="";


  Future<VerificationCodeResponse> VerificationCode ({ VerificationCodeModel verificationCodeModel}) async{

    print(json.encode( verificationCodeModel.toJson()  )) ;
    try {
      http.Response response = await http.post(
        Uri.parse(url2),
        headers: {'Content-type': 'application/json'},
        body: json.encode( verificationCodeModel.toJson() ),
      );
      /*    print('response');
      print(response.body);*/
      autorisation = response.headers['authorization'];
      final data = jsonDecode(response.body);
    toastMessage(data["message"]);
      return   response.statusCode == 401 ? (VerificationCodeResponse.fromJson(json.decode(response.body))) : "ok";
    } catch(e){

    }
  }


}
void toastMessage(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      fontSize: 16.0
  );
}

