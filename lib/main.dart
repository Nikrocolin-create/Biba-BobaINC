import 'package:flutter/material.dart';
import 'package:your_brand/ListOfWear.dart';
import 'package:your_brand/ButtonModule.dart';
import 'package:your_brand/ProductInfo.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        ProductInfoScreen.routeName: (context) => ProductInfoScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Column(
       children: [
         Expanded(
           flex: 2,
           child: WeatherTab(color: Colors.green,),
         ),
        Expanded(
            flex:10,
            child: WearList(),),
         Expanded(
            flex:2,
            child: ButtonPanel(),),
       ],
      ),
    );
  }
}

class WeatherTab extends StatefulWidget{
  final Color color;

  const WeatherTab({Key key, this.color}) : super(key: key);
  @override
  _WeatherTabPageState createState() {
    return _WeatherTabPageState(color);
  }
}

class _WeatherTabPageState extends State<WeatherTab>{
  Color contColor;
  _WeatherTabPageState(Color color) {
    contColor = color;
  }

  Widget build (BuildContext context) {
    return Container(
      height: 50,
      color: contColor,
    );
  }
}



