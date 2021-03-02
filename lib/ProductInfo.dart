import 'package:flutter/material.dart';

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
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
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
        ],
      ),
    );
  }
}

class PriceAndBrand extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

  }
}