import 'dart:convert';
import '../services/networking.dart';

// import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';

const apiKey = 'a8d5d03c2b724dfd68295a7bb045539d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double long;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    // print(location.latitude);
    // print(location.longitude);

    lat = location.latitude;
    long = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');

var weatherData=await networkHelper.getData();

   
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
      body: Center(
          // child: RaisedButton(
          //   onPressed: () {
          //     //Get the current location
          //     // getLocation();
          //   },
          //   child: Text('Get Location'),
          // ),
          ),
    );
  }
}
