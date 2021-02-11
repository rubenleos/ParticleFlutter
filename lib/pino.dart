import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pino extends StatefulWidget {
  Pino({Key key}) : super(key: key);

  @override
  _PinoState createState() => _PinoState();
}

Map data, data2;

Future<String> getDataA() async {
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
}

class _PinoState extends State<Pino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("pino "),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://i.pinimg.com/originals/21/59/1e/21591e08b4b6cbcb3aa837e7eaf55402.gif",
                    ),
                    fit: BoxFit.cover),
              ),
              height: 360,
              width: 800,
              //margin: EdgeInsets.only(bottom: 15),

              // color: Colors.blue,
            ),
            Container(
              height: 280,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
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
                  Text(
                    "ENCENDER ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(),
                  IconButton(
                    visualDensity: VisualDensity(vertical: 4, horizontal: 4),
                    icon: Icon(
                      Icons.power_settings_new,
                      color: Colors.red,
                    ),
                    onPressed: getData2,
                  ),
                  Text(
                    "APAGAR",
                    style: TextStyle(color: Colors.white),
                  ),
                  Divider(),
                  //Container(child: Text(data2.toString())),
                ]),
              ),
            )
          ],
        ));
  }
}
