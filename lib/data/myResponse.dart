import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import 'package:flutter/services.dart';

import '../screen/MyHomePage.dart';

class myResponse{



  static Future order_list() async {


    http.Response rest= await http.get(
        Uri.parse('https://event-reg.app/flutter_test/api/orders'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J'
    });
    String jsonsDataString = rest.body.toString();
    var    data = jsonDecode(jsonsDataString);
    print(data);
    return data;

  }

  static Future products() async {

    http.Response rest= await http.get(
        Uri.parse('https://event-reg.app/flutter_test/api/products'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J'
    });
    String jsonsDataString = rest.body.toString();
    var    data = jsonDecode(jsonsDataString);
    print(data);
   return data;

}

  static Future Sginup(String email,String password,String name,String c_password) async {
    var mydata = jsonEncode({
      'name':name,
      'c_password':c_password,

      'email':email,
      'password': password
    });

    http.Response rest= await http.post(
        Uri.parse('https://event-reg.app/flutter_test/api/register'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J'
    },body:mydata );
    String jsonsDataString = rest.body.toString();
    var    data = jsonDecode(jsonsDataString);

    if (data['success'].toString() == "true") {
      saveperf(email);
      Get.to(MyHomePage());
      Fluttertoast.showToast(msg:data['message'].toString(),


          toastLength:
          Toast.LENGTH_SHORT,
          //gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,

          backgroundColor: Colors.white,
          textColor: Colors.deepOrange,

          fontSize: 16.0
      );



    }
    else
    {
      if(data['data']['c_password'].toString()!="null")

      Fluttertoast.showToast(msg:'The c password and password must match',


          toastLength:
          Toast.LENGTH_SHORT,
          //gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,

          backgroundColor: Colors.white,
          textColor: Colors.deepOrange,

          fontSize: 16.0
      );
      if(data['data']['email'].toString()!="null")

        Fluttertoast.showToast(msg:'The email must be a valid email address',


            toastLength:
            Toast.LENGTH_SHORT,
            //gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,

            backgroundColor: Colors.white,
            textColor: Colors.deepOrange,

            fontSize: 16.0
        );

    }

    print(data['success'].toString());


  }

  static Future Login(String email,String password) async {
    var mydata = jsonEncode({  'email':email,
      'password': password
    });

    http.Response rest= await http.post(
        Uri.parse('https://event-reg.app/flutter_test/api/login'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J'
    },body:mydata );
    String jsonsDataString = rest.body.toString();
    var    data = jsonDecode(jsonsDataString);

    if (data['success'].toString() == "true") {
saveperf(email);
      Get.to(MyHomePage());

    }
    else
    {
  Fluttertoast.showToast(msg:"?????????????? ????????",

          toastLength:
          Toast.LENGTH_SHORT,
          //gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,

          backgroundColor: Colors.white,
          textColor: Colors.deepOrange,

          fontSize: 16.0
      );

    }

    print(data['success'].toString());


  }


  static  saveperf(String username)async  {

    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("username", username);
    print(sharedPreferences.get("username"));

  }
  static Future order_del(String product_id) async {


    http.Response rest= await http.get(
        Uri.parse('https://event-reg.app/flutter_test/api/orders/${product_id}'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J'
    } );
    String jsonsDataString = rest.body.toString();
    var    data = jsonDecode(jsonsDataString);
    Fluttertoast.showToast(msg:"Delated",

        toastLength:
        Toast.LENGTH_SHORT,
        //gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,

        backgroundColor: Colors.white,
        textColor: Colors.deepOrange,

        fontSize: 16.0
    );


    print(data.toString());


  }


  static Future order(String product_id) async {
    var mydata = jsonEncode({  'product_id':product_id
    });

    http.Response rest= await http.post(
        Uri.parse('https://event-reg.app/flutter_test/api/orders'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J'
    },body:mydata );
    String jsonsDataString = rest.body.toString();
    var    data = jsonDecode(jsonsDataString);

    if (data['success'].toString() == "true") {


      Fluttertoast.showToast(msg:"The order has been added successfully",

          toastLength:
          Toast.LENGTH_SHORT,
          //gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,

          backgroundColor: Colors.white,
          textColor: Colors.deepOrange,

          fontSize: 16.0
      );
    }
    else
    {
      Fluttertoast.showToast(msg:"error in order",

          toastLength:
          Toast.LENGTH_SHORT,
          //gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,

          backgroundColor: Colors.white,
          textColor: Colors.deepOrange,

          fontSize: 16.0
      );
    }

    print(data['success'].toString());


  }



  static Future comments(String id) async {

    http.Response rest= await http.get(
        Uri.parse('https://event-reg.app/flutter_test/api/products/${id}'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 2|Krr2meJWbTKIR4iCWTX3JysazBcUY4AoCJOHdH9J'
    });
    String jsonsDataString = rest.body.toString();
    var    data = jsonDecode(jsonsDataString);
    print(data);
    return data;

  }




}