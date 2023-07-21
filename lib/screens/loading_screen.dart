import 'package:clima_flutter/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../logger.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position? _Position = Position.fromMap({'latitude': 0.0, 'longitude': 0.0});

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
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
              Text(_Position.toString())
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
}
