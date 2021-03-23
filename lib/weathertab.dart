import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class WeatherTab extends StatefulWidget {
  final Color color;

  const WeatherTab({Key key, this.color}) : super(key: key);

  @override
  _WeatherTabPageState createState() {
    return _WeatherTabPageState(color);
  }
}

class _WeatherTabPageState extends State<WeatherTab> {
  Color contColor;
  dynamic WeatherInfo;
  String API_KEY = "b490a96656a37e056af542ed05fde06c";

  _WeatherTabPageState(Color color) {
    contColor = color;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      const oneSecond = const Duration(seconds: 25);
      new Timer.periodic(oneSecond, (Timer t) => build(context));
    });
  }

  Widget buildWeatherWidget() {
    Widget vistitCount = new Center(
      child: new FutureBuilder<String>(
        future: fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print('Data: ${snapshot.data.toString()}');
              /* below text needs to be updated every 5 mins or so */
              return new Text('#' + snapshot.data.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 34.0));
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
          }

          // By default, show a loading spinner
          return new CircularProgressIndicator();
        },
      ),
    );
    return vistitCount;
  }

  Future<dynamic> fetchWeather() async {
    Position position;
    "api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}";
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("position: ${position}");
    dynamic weather = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}'
        '&appid=${API_KEY}');
    print("weather: ${weather.body.runtimeType}");
    WeatherInfo = jsonDecode(weather.body);
    print("WeatherINFO: ${WeatherInfo.runtimeType}");
    print("WeatherINFO: ${WeatherInfo["weather"]}");
    print("WeatherINFO: ${WeatherInfo["weather"][0]["main"]}");
    print("WeatherINFO: ${WeatherInfo["main"]["temp"]}");
    return WeatherInfo;
  }

  Widget build(BuildContext context) {
    return Container(
      child: new FutureBuilder<dynamic>(
        future: fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data.runtimeType);
              /*'Data: ${snapshot.data["weather"][1]["main"]} ${snapshot.data["main"]["temp"]}'*/
              /* below text needs to be updated every 5 mins or so */
              return Container(
                  color: colorMaker(),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/80, MediaQuery.of(context).size.height/15 , 0, MediaQuery.of(context).size.height/50),
                  child:Text(snapshot.data["weather"][0]["main"].toString() + ", " + (snapshot.data["main"]["temp"] - 273).round().toString() + "°C",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 34.0)),
          );
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
          }
          // By default, show a loading spinner
          return new CircularProgressIndicator();
        },
      ),
    );
  }
  Color colorMaker() {
    double temperature = WeatherInfo["main"]["temp"] - 273;
    if (temperature >= 30)
      return Colors.yellowAccent;
    if (temperature >= 20)
      return Colors.green;
    if (temperature >=10)
      return Colors.greenAccent;
    if (temperature >= -5)
      return Colors.lightBlueAccent;
    return Colors.blueAccent;
  }
}
