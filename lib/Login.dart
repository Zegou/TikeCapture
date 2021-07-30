
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
import 'package:flutter_localizations/flutter_localizations.dart';
*/

import 'package:tike_consumer/SettingPageProfile.dart';
import 'package:tike_consumer/library/country_code_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:tike_consumer/library/country_code.dart';

import 'dart:convert';
import 'package:tike_consumer/library/otp_field.dart';
import 'package:tike_consumer/model/VerificationCodeModel.dart';
import 'package:tike_consumer/model/VerificationCodeResponse.dart';
import 'package:tike_consumer/styles/style.dart';


import 'package:tike_consumer/library/localizations.dart';
import 'package:tike_consumer/model/RegisterModel.dart';
import 'package:tike_consumer/model/RegisterResponse.dart';
import 'package:tike_consumer/model/LoginModel.dart';
import 'package:tike_consumer/model/LoginResponse.dart';

import 'package:http/http.dart' as http;

/*
import 'api/registerApi.dart';
*/

class Login extends StatefulWidget {
   int userid  ;
   String PhoneNumber ;
   String messages = "";
   String PhoneNumberWithoutIndice ;

   Login({this.userid , this.PhoneNumber , this.PhoneNumberWithoutIndice}) ;

  @override
  _LoginState createState() => _LoginState(userid : userid, PhoneNumber: PhoneNumber , PhoneNumberWithoutIndice: PhoneNumberWithoutIndice);
}

class _LoginState extends State<Login> {
   int userid ;
   String PhoneNumber;
   String PhoneNumberWithoutIndice;


  _LoginState({this.userid,this.PhoneNumber, this.PhoneNumberWithoutIndice});

  bool _isloading = false ;
   bool _isloading2 = false ;

   String apiUrl = "";
  String messages = "";

  // Send Request For registration
  final _formKey = GlobalKey<FormState>();
  FocusNode _phonenumberFocusNode = FocusNode();
  final TextEditingController _phonenumberController = TextEditingController();

  RegisterModel registerModel = new RegisterModel();
   LoginModel loginModel = new LoginModel();
   CurrentUser _currentUser = CurrentUser();

/*
  RegisterApi registerApi = new RegisterApi();
*/

  // Send request for Code Verification
 final _formKeyverif = GlobalKey<FormState>();
   OTPTextField otpTextField = new OTPTextField();

   final TextEditingController _codeController = TextEditingController();
  final VerificationCodeModel verificationCodeModel = new VerificationCodeModel();


   final String  url ="https://tabiz.cs4africa.com/tike/tike/api_v_1.0/user/create" ;
  /*final String  url ="https://tabiz.cs4africa.com/schooldemo/Authentication/Login/Submit" ;*/
  final String  url2 ="https://tabiz.cs4africa.com/tike/tike/api_v_1.0/user/checkcode" ;
  final String  url3 ="https://tabiz.cs4africa.com/tike/tike/api_v_1.0/user/login" ;

   String autorisation2="";
   String id2 ="";
   String autorisation="";
   int id =0;

   @override
   void dispose() {
     // TODO: implement dispose
     super.dispose();
     _phonenumberController.dispose() ;
   }
// Assets Functions  With Responses include
   Future<RegisterResponse> Register ({RegisterModel registerModel}) async {
     print(json.encode(registerModel.toJson()));
     try {
       http.Response response = await http.post(
         Uri.parse(url),
         headers: {'Content-type': 'application/json'},
         body: json.encode(registerModel.toJson()),
       );
       /*    print('response');
      print(response.body);*/
       autorisation = response.headers['authorization'];
       final data = jsonDecode(response.body);
       toastMessage(data["message"]);
       int idid = data["result"]["user_id"];


     Navigator.of(context).push(MaterialPageRoute(

           builder: (c) => Login(userid: idid, PhoneNumber: registerModel.phone , PhoneNumberWithoutIndice: this.PhoneNumberWithoutIndice)
       ));





     } catch (e) {

     }
   }
   Future<VerificationCodeResponse> VerificationCode ({VerificationCodeModel verificationCodeModel}) async{


    try {
      http.Response response = await http.post(
        Uri.parse(url2),
        headers: {'Content-type': 'application/json'},
        body: json.encode( verificationCodeModel.toJson() ),
      );

      autorisation = response.headers['authorization'];
      final data = jsonDecode(response.body);
        bool isOkay = data["isOkay"];
      print(isOkay);
      if(isOkay==false){
        toastMessage(data["message"]);
      }else if(isOkay==true){


        // Login function has to be call here
        LoginConnectFunction(this.PhoneNumber);


      }

    } catch(e){

    }


  }
  Future<ResponseLogin> LoginConnect ({LoginModel loginModel}) async{


    try {
      http.Response response = await http.post(
        Uri.parse(url3),
        headers: {'Content-type': 'application/json'},
        body: json.encode( loginModel.toJson() ),
      );

      autorisation = response.headers['authorization'];
      final data = jsonDecode(response.body);

      bool isOkay = data["result"]["isOkay"];

      if(isOkay==false){
        toastMessage(data["result"]["message"]);
      }else if(isOkay==true){
        toastMessage(data["result"]["message"]);
        int user_id = data["result"]["user_id"];

        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) => ProfileUI2(user_id:user_id , username: this.PhoneNumber, autorization:autorisation))
        );



      }



    } catch(e){

    }


  }

  // Functions
  Future<void> _Registration() async{

    if(_formKey.currentState.validate()){

      setState(() {
        _isloading = true ;
      });
      _formKey.currentState.save();



      registerModel.phone = "254"+_phonenumberController.text.trim();
      registerModel.countryId ="110";
      this.PhoneNumberWithoutIndice = _phonenumberController.text.trim();


      try {
        await Register(registerModel: registerModel).then((value) {

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
  }
  _VerificationCode(String pin)  async {

    if(_formKeyverif.currentState.validate()){

      setState(() {
        _isloading2 = true ;
      });
      _formKeyverif.currentState.save();



      verificationCodeModel.code = pin.toString();
      verificationCodeModel.userId = this.userid;


      try {
        await  VerificationCode(verificationCodeModel: verificationCodeModel).then((value) {
        });
        setState(() {
          _isloading2 = false;
        });
      } catch (e) {
        print(e);
        setState(() {
          _isloading2 = false;
        });
      }
    }
  }
  LoginConnectFunction(String PhoneNumber) async {
    // if (!_formKey.currentState.validate()) {
    //   return;
    // }

    loginModel.isRenewalPasswordRequest ="false" ;
    /*****recuperer les données du formulaires :*****/
    // _currentUser.accountName = _accountNameController.text.trim() ;
    // _currentUser.userName =  _userNameController.text.trim() ;
    // _currentUser.passWord =  _passwordController.text.trim() ;


    _currentUser.accountName = "DEMO";
    _currentUser.userName = PhoneNumber;
    _currentUser.passWord = PhoneNumber;
    loginModel.currentUser = _currentUser;


    try {
      await  LoginConnect(loginModel: loginModel).then((value) {
      });
      setState(() {
        _isloading2 = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isloading2 = false;
      });
    }
  }



  // This widget is the root of your application.

  TextStyle style2 = TextStyle(fontFamily: 'MontserratLight',  color: Colors.white,decorationColor: Colors.white);

  TextStyle style = TextStyle(fontFamily: 'MontserratLight', fontSize: 17.0, color: Colors.white,decorationColor: Colors.white);
  TextStyle styleTitle = TextStyle(fontFamily: 'MontserratBold', color:Colors.black);
  TextStyle styleMedium = TextStyle(fontFamily: 'MontserratMedium', color:Colors.black);
  TextStyle styleContent = TextStyle(fontFamily: 'MontserratRegular', fontSize: 17.0, color: Colors.black);

  @override
  Widget build(BuildContext context) {


    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      localizationsDelegates: [
        AppLocalizationsDelegate(),
      ],
      supportedLocales: [Locale("en"), Locale("fr")],

      onGenerateTitle: (BuildContext context) =>
      AppLocalizations.of(context).title,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: /*new MyHomePage(title: 'Flutter Demo Home Page',isloading: _isloading, phonenumberController: _phonenumberController,formKey: _formKey)*/
      Scaffold(
        /*appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),*/
        body: SingleChildScrollView(
          /*  padding: EdgeInsets.all(10.0),*/
            child: Center(
              child: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/images/tikebgblack.png"), fit: BoxFit.cover,),                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(
                        height: 190,
                      ),SizedBox(
                        height: 33,
                      ),
/*
                    Center(child: Text("-----", style: TextStyle(color: Colors.white , fontFamily: "MontserratRegular" ,fontSize: 30)),),
                    */
                      Center(child: Text("Register now", style: TextStyle(color: Colors.white , fontFamily: "MontserratLight",decorationColor: Colors.white,fontSize: 17.0)),),
                      SizedBox(
                        height: 110,
                      ),

                      Form(
                        key: _formKey,

                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              CountryCodePicker(
                                onChanged: print,
                                textStyle: TextStyle(color: Colors.white , fontFamily: "MontserratLight"),
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'CI',
                                countryFilter: ['CI', 'KE'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),
                              new Flexible(
                                child: new TextField(
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  style: style,
                                  controller: _phonenumberController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                      border: InputBorder.none,
                                      hintText: this.PhoneNumberWithoutIndice != null?this.PhoneNumberWithoutIndice:"Your phone number",
                                      hintStyle:  TextStyle(fontFamily: 'MontserratBold', fontSize: 15.0, color: Colors.white,decorationColor: Colors.white),
                                      suffixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      )),
                                ),
                              ),


                            ]
                        ),
                      ),


                      SizedBox(
                        height: 20,
                      ),

                      _isloading ?
                      Center(child: CircularProgressIndicator(),) : Material(
                        elevation: 2.0,
                        color: Color(0xffffffff),
                        child: MaterialButton(
                          minWidth: 150,
                          padding: EdgeInsets.fromLTRB(0.0, 3.0, 3.0, 3.0),
                          onPressed: _Registration,
                          child: Text("validate",
                              textAlign: TextAlign.center,
                              style: style.copyWith(
                                color: Colors.black38, fontWeight: FontWeight.bold , fontFamily: 'MontserratRegular',)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                  Form(
                    key: _formKeyverif,
                      child : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            OTPTextField(
                              length: 6,

                              width: MediaQuery.of(context).size.width,
                              fieldWidth: 40,
                              borderColor: Colors.white,

                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                decorationColor: Colors.white,
                              ),
                              textFieldAlignment: MainAxisAlignment.spaceAround,


                              fieldStyle: FieldStyle.box,

                              onCompleted: (pin) async {

                                return showDialog(
                                  context: context,
                                  barrierDismissible: false, // user must tap button for close dialog!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Politique de confidentialité"),titleTextStyle: styleTitle,
                                      content:  _isloading2 ? Center(child: CircularProgressIndicator()) : Text("Politique de confidentialité Politique de confidentialité Politique de confidentialité"),contentTextStyle: styleContent,
                                      actions: [
                                        FlatButton(
                                          child: const Text('CANCEL', style: TextStyle(fontFamily: 'MontserratMedium', color:Colors.black, fontWeight: FontWeight.bold

                                          )),
                                          onPressed: () {
                                            Navigator.of(context).pop(ConfirmAction.CANCEL);
                                          },
                                        ),
                                        FlatButton(
                                          child: const Text('ACCEPT',style: TextStyle(fontFamily: 'MontserratMedium', color:Colors.black, fontWeight: FontWeight.bold
                                          )),
                                          onPressed:() {_VerificationCode(pin);}  /*() {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (c) =>
                                                    ProfileUI2())
                                            );
                                          },*/
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                            )

                          ]
                      )
                  ),
                      SizedBox(
                        height: 45,
                      ) ,


                      Center(
                          child: Text(
                              "By continuing you agree to our Terms and Conditions of our privacy policy.",
                              textAlign :  TextAlign.center,
                              style: style2
                          )
                      ),

                      SizedBox(
                        height: 21,
                      )
                    ],
                  ),
                ),

              ),

            )

        ),
      ),

    );
  }



}
/*class MyHomePage extends StatelessWidget {




   MyHomePage({Key key,  this.title, this.isloading, this.phonenumberController, this.formKey, this.registerModel, this.registerApi}) : super(key: key);
  final String title;
    bool isloading;
  final TextEditingController phonenumberController ;
  final GlobalKey<FormState> formKey;
  final RegisterModel registerModel;
  final RegisterApi registerApi ;

  Future<void> _Registration() async{

    if(formKey.currentState.validate()){
      isloading = true;


      formKey.currentState.save();

      // if (!_formKey.currentState.validate()) {
      //   return;
      // }


      *//*****recuperer les données du formulaires :*****//*
      // _currentUser.accountName = _accountNameController.text.trim() ;
      // _currentUser.userName =  _userNameController.text.trim() ;
      // _currentUser.passWord =  _passwordController.text.trim() ;



      registerModel.phone = phonenumberController.text.trim();
      registerModel.countryId ="110";



      try {
        await registerApi.Register(registerModel: registerModel).then((value) {

          toastMessage(value.message);
          isloading = false;
        });

      } catch (e) {
        print(e);
        isloading = false;

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var value_privacy_policy_label = AppLocalizations.of(context).privacy_policy_label;
    var value_privacy_policy_body = AppLocalizations.of(context).privacy_policy_body;

    if (value_privacy_policy_label != null) {
      AppLocalizations.of(context).privacy_policy_label;
    }
    if (value_privacy_policy_body != null) {
      AppLocalizations.of(context).privacy_policy_body;
    }
    String msgError = "";
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextStyle style2 = TextStyle(fontFamily: 'MontserratLight',  color: Colors.white,decorationColor: Colors.white);

    TextStyle style = TextStyle(fontFamily: 'MontserratLight', fontSize: 17.0, color: Colors.white,decorationColor: Colors.white);
    TextStyle styleTitle = TextStyle(fontFamily: 'MontserratBold', color:Colors.black,

    );
    TextStyle styleMedium = TextStyle(fontFamily: 'MontserratMedium', color:Colors.black,

    );
    TextStyle styleContent = TextStyle(fontFamily: 'MontserratRegular', fontSize: 17.0, color: Colors.black);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment page',
      home: Scaffold(
        *//*appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),*//*
        body: SingleChildScrollView(
          *//*  padding: EdgeInsets.all(10.0),*//*
            child: Center(
              child: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/images/tikebgblack.png"), fit: BoxFit.cover,),                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(
                        height: 190,
                      ),SizedBox(
                        height: 33,
                      ),
*//*
                    Center(child: Text("-----", style: TextStyle(color: Colors.white , fontFamily: "MontserratRegular" ,fontSize: 30)),),
                    *//*
                      Center(child: Text(AppLocalizations.of(context).text_login_text, style: TextStyle(color: Colors.white , fontFamily: "MontserratLight",decorationColor: Colors.white,fontSize: 17.0)),),
                      SizedBox(
                        height: 110,
                      ),

                  Form(
                    key: formKey,

                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          CountryCodePicker(
                            onChanged: print,
                            textStyle: TextStyle(color: Colors.white , fontFamily: "MontserratLight"),
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'CI',
                            countryFilter: ['CI', 'KE'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                          new Flexible(
                            child: new TextField(
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              style: style,
                              controller: phonenumberController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                  border: InputBorder.none,
                                  hintText: AppLocalizations.of(context).phonenumber_login_label,
                                  hintStyle:  TextStyle(fontFamily: 'MontserratBold', fontSize: 15.0, color: Colors.white,decorationColor: Colors.white),
                                  suffixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  )),
                            ),
                          ),


                        ]
                    ),
                  ),


                      SizedBox(
                        height: 20,
                      ),

                      isloading ?
                      Center(child: CircularProgressIndicator(),) : Material(
                        elevation: 2.0,
                        color: Color(0xffffffff),
                        child: MaterialButton(
                          minWidth: 150,
                          padding: EdgeInsets.fromLTRB(0.0, 3.0, 3.0, 3.0),
                          onPressed: _Registration,
                          child: Text(AppLocalizations.of(context).button_login_text,
                              textAlign: TextAlign.center,
                              style: style.copyWith(
                                color: Colors.black38, fontWeight: FontWeight.bold , fontFamily: 'MontserratRegular',)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            OTPTextField(
                              length: 4,
                              width: MediaQuery.of(context).size.width,
                              fieldWidth: 40,
                              borderColor: Colors.white,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                decorationColor: Colors.white,
                              ),
                              textFieldAlignment: MainAxisAlignment.spaceAround,

                              fieldStyle: FieldStyle.box,

                              onCompleted: (pin) async {

                                return showDialog(
                                  context: context,
                                  barrierDismissible: false, // user must tap button for close dialog!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(value_privacy_policy_label),titleTextStyle: styleTitle,
                                      content:  Text(value_privacy_policy_body),contentTextStyle: styleContent,
                                      actions: [
                                        FlatButton(
                                          child: const Text('CANCEL', style: TextStyle(fontFamily: 'MontserratMedium', color:Colors.black, fontWeight: FontWeight.bold

                                          )),
                                          onPressed: () {
                                            Navigator.of(context).pop(ConfirmAction.CANCEL);
                                          },
                                        ),
                                        FlatButton(
                                          child: const Text('ACCEPT',style: TextStyle(fontFamily: 'MontserratMedium', color:Colors.black, fontWeight: FontWeight.bold

                                          )),
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (c) =>
                                                    ProfileUI2())
                                            );
                                          },
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                            )

                          ]
                      ),
                      SizedBox(
                        height: 45,
                      ) ,


                      Center(
                          child: Text(
                              AppLocalizations.of(context).privacy_login_text,
                              textAlign :  TextAlign.center,
                              style: style2
                          )
                      ),

                      SizedBox(
                        height: 21,
                      )
                    ],
                  ),
                ),

              ),

            )

        ),
      ),
    );
  }
}*/
void toastMessage(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
      textColor: Colors.white
  );
}
void _showDialog(BuildContext context) {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context).privacy_policy_label),
        content: Text("AppLocalizations.of(context)!.privacy_login_text"),
        actions: [
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {},
            child: Text('ANNULER'),
          ),
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(
                builder: (c) => Welcome()));*/
            },
            child: Text('ACCEPTEZ'),
          ),
        ],
      );
    },
  );
}

enum ConfirmAction { CANCEL, ACCEPT }
Future _asyncConfirmDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset settings?'),
        content: const Text(
            'This will reset your device to its default factory settings.'),
        actions: [
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('ACCEPT'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}

