import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Flutt extends StatefulWidget {
  Flutt({Key key}) : super(key: key);

  @override
  _FluttState createState() => _FluttState();
}

class _FluttState extends State<Flutt> {
  Map data, data2;
  double datos;

  Future<String> getData() async {
    var response = await http.post(

        // replace with your device id.
        // also update the access token with your own.
        Uri.encodeFull(
            "https://api.particle.io/v1/devices/3b002a000947363335343832/led"),
        headers: {
          "Accept": "application/json"
        },
        body: {
          "arg": "on",
          "access_token": "23ae0f41c501c9f2c22104778f78589ac9cc6118"
        });
    data = json.decode(response.body);

    print(data);

    return "Success!";
  }

  Future<String> getDataB() async {
    var response = await http.post(

        // replace with your device id.
        // also update the access token with your own.
        Uri.encodeFull(
            "https://api.particle.io/v1/devices/3b002a000947363335343832/led1"),
        headers: {
          "Accept": "application/json"
        },
        body: {
          "arg": "on",
          "access_token": "23ae0f41c501c9f2c22104778f78589ac9cc6118"
        });
    data = json.decode(response.body);

    print(data);

    return "Success!";
  }

  Future<String> getDataC() async {
    var response = await http.post(

        // replace with your device id.
        // also update the access token with your own.
        Uri.encodeFull(
            "https://api.particle.io/v1/devices/3b002a000947363335343832/led1"),
        headers: {
          "Accept": "application/json"
        },
        body: {
          "arg": "on",
          "access_token": "23ae0f41c501c9f2c22104778f78589ac9cc6118"
        });
    data = json.decode(response.body);

    print(data);

    return "Success!";
  }

  List<dynamic> datoss = [];

  Future<List<dynamic>> cargarDatos() async {
    var resp = await http.post(

        // replace with your device id.
        // also update the access token with your own.
        Uri.encodeFull(
            "https://api.particle.io/v1/devices/3b002a000947363335343832/gradosC"),
        headers: {"Accept": "application/json"},
        body: {"access_token": "23ae0f41c501c9f2c22104778f78589ac9cc6118"});
    Map<String, dynamic> data3 = json.decode(resp.body);
    datoss = data3['return_value'];
    return datoss;
  }

  @override
  Widget build(BuildContext context) {
    ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Particle IoT"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: null),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
              ),
              title: Text("Pino "),
              onTap: () {
                Navigator.pushNamed(context, "/Pino");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.family_restroom_sharp),
              title: Text("Nacimiento"),
              onTap: () {
                Navigator.pushNamed(context, "/Nacimiento");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.fireplace),
              title: Text("Chimenea"),
              onTap: () {
                Navigator.pushNamed(context, "/Chimenea");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.pets_rounded),
              title: Text("Alimentar"),
              onTap: () {
                Navigator.pushNamed(context, "/Mascota");
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
