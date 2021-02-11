import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FlutterToParticle extends StatefulWidget {
  @override
  FlutterToParticleState createState() => new FlutterToParticleState();
}

class FlutterToParticleState extends State<FlutterToParticle> {
  //Map data;
  // 3b002a000947363335343832

  Future<String> getData() async {
    var response = await http.post(

        // replace with your device id.
        // also update the access token with your own.
        Uri.encodeFull(
            "https://api.particle.io/v1/devices/3b002a000947363335343832/led"),
        body: {
          "arg": "on",
          "access_token": "23ae0f41c501c9f2c22104778f78589ac9cc6118"
        });
    // data = JSON.decode(response.body);
    //print(data);

    return "Success!";
  }

  Float i;

  Future<String> getData2() async {
    var response = await http.post(

        // replace with your device id.
        // also update the access token with your own.
        Uri.encodeFull(
            "https://api.particle.io/v1/devices/3b002a000947363335343832/led"),
        body: {
          "arg": "off",
          "access_token": "23ae0f41c501c9f2c22104778f78589ac9cc6118",
        });
    // data = JSON.decode(response.body);
    //print(data);
    print(response.body);
    return "Success!";
  }

  List<dynamic> datos = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xff7c94b6),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://ss154.liverpool.com.mx/xl/1060534558.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          width: 450,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Column(children: [
              RaisedButton(
                child: Text("Dar de comer "),
                onPressed: getData,
                color: Colors.blueAccent,
                highlightColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              RaisedButton(
                  child: Text("cerrar comida "),
                  onPressed: getData2,
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  splashColor: Colors.grey,
                  highlightElevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ]),
          ),
        ),
      ),
    );
  }
}
