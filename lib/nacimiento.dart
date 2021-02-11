import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Nacimiento extends StatefulWidget {
  Nacimiento({Key key}) : super(key: key);

  @override
  _NacimientoState createState() => _NacimientoState();
}

Map data, data2;
Future<String> getDataA() async {
  var response = await http.post(

      // replace with your device id.
      // also update the access token with your own.
      Uri.encodeFull(
          "https://api.particle.io/v1/devices/3b002a000947363335343832/chimenea"),
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

Future<String> getData2() async {
  var response = await http.post(

      // replace with your device id.
      // also update the access token with your own.
      Uri.encodeFull(
          "https://api.particle.io/v1/devices/3b002a000947363335343832/chimenea"),
      body: {
        "arg": "off",
        "access_token": "23ae0f41c501c9f2c22104778f78589ac9cc6118",
      });
}

class _NacimientoState extends State<Nacimiento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("nacimiento"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://services.meteored.com/img/article/se-acerca-navidad-sabes-cual-es-el-origen-de-la-estrella-de-belen-223881-3.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
              height: 400,
              width: 800,
              margin: EdgeInsets.only(bottom: 15),

              // color: Colors.blue,
            ),
            Divider(),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(children: [
                  Divider(),
                  IconButton(
                    visualDensity: VisualDensity(vertical: 4, horizontal: 4),
                    icon: Icon(
                      Icons.power_settings_new,
                      color: Colors.green,
                    ),
                    onPressed: getDataA,
                  ),
                  Text("ENCENDER "),
                  Divider(),
                  IconButton(
                    visualDensity: VisualDensity(vertical: 4, horizontal: 4),
                    icon: Icon(
                      Icons.power_settings_new,
                      color: Colors.red,
                    ),
                    onPressed: getData2,
                  ),
                  Text("APAGAR"), Divider(),
                  //Container(child: Text(data2.toString())),
                ]),
              ),
            )
          ],
        ));
  }
}
