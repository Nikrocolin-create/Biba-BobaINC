import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
class ProductArguments {
  final String id;

  ProductArguments(this.id);
}

class ProductInfoScreen extends StatelessWidget {
  static const routeName = '/product';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ProductArguments args = ModalRoute.of(context).settings.arguments;
    DatabaseReference _testdb = FirebaseDatabase.instance.reference().child('your-brand-2217e-default-rtdb'); // name of instance
    _testdb.set("${args}");
    return Scaffold(
      appBar: AppBar(
        title: Text(args.id.toString(),
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Century",
          ),),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/40),
            height:  MediaQuery.of(context).size.height/4,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.yellow,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          PriceAndBrand(args.id.toString()),
        ],
      ),
    );
  }
}

class PriceAndBrand extends StatelessWidget{
  dynamic id;
  PriceAndBrand(dynamic name){
    id = name;
  }
  @override
  Widget build(BuildContext context) {
      return Row(
        children: [
          Price(id),
          Brand(id)
        ],
      );
  }
}

class Price extends StatelessWidget {
  dynamic id;
  Price(dynamic name){
    id = name;
  }
  Widget build (BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20, MediaQuery.of(context).size.width/20,
          MediaQuery.of(context).size.width/20, MediaQuery.of(context).size.width/20),
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/25, MediaQuery.of(context).size.width/25,
          MediaQuery.of(context).size.width/25, MediaQuery.of(context).size.width/25),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      width: MediaQuery.of(context).size.width/2.5,
      height: MediaQuery.of(context).size.width/5.5,
      child: Text(id),
    );
  }
}

class Brand extends StatelessWidget{
  dynamic id;
  Brand(dynamic name){
    id = name;
  }
    Widget build (BuildContext context) {
      return Container(
        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/20, MediaQuery.of(context).size.width/20,
            MediaQuery.of(context).size.width/20, MediaQuery.of(context).size.width/20),
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/25, MediaQuery.of(context).size.width/25,
            MediaQuery.of(context).size.width/25, MediaQuery.of(context).size.width/25),
        decoration: BoxDecoration(border: Border.all(color: Colors.redAccent)),
        width: MediaQuery.of(context).size.width/2.5,
        height: MediaQuery.of(context).size.width/5.5,
        child: Text(id),
      );
    }
}