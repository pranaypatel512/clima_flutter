import 'dart:convert';

import 'package:clima_flutter/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../logger.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    // Position position = await _determinePosition();
                    // setState(() {
                    //   _Position = position;
                    // });
                  },
                  child: Text('Get Location')),
            ],
          ),
        ),
      ),
    );
  }

  void getLocation() async {
    Location location = Location();
    location.latitude;
    location.longitude;
    log("${location.latitude}:${location.longitude}");
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=23.0225&lon=72.5714&appid=ef7a6d795a6fc79ed30ef4a9dfede057'));
    log(response.body);

    var id = jsonDecode(response.body)['weather'][0]['id'];
    var temp = jsonDecode(response.body)['main']['temp'];
    var name = jsonDecode(response.body)['name'];
    log('$id:$temp:$name');
  }
}
