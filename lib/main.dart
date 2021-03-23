import 'package:flutter/material.dart';
import 'package:your_brand/ListOfWear.dart';
import 'package:your_brand/ButtonModule.dart';
import 'package:your_brand/ProductInfo.dart';
import 'weathertab.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: Scaffold(
        body: Column(
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
      ),
    );
  }
}





