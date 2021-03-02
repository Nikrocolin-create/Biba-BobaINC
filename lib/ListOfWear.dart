import 'package:flutter/material.dart';
import 'package:your_brand/ProductInfo.dart';
import 'main.dart';
class WearList extends StatefulWidget {
  @override
  _WearListState createState() {
    return _WearListState();
  }
}

class _WearListState extends State<WearList> {
  int clothes=7;
  List<String> mock_list = ["one","two","three","four","five", "six","seven"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: clothes,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        return Container(
          child: InfoBlock(mock_list[index]),
        );
      },
    );
  }
}

class InfoBlock extends StatelessWidget {
  String title;
  InfoBlock(String t) {
    title = t;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductInfoScreen.routeName,
                arguments: ProductArguments(title),);
            },
            child: Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width/2.2,
              height: MediaQuery.of(context).size.height/4.7,
            ),
          ),
          Column(
            children: [
              Text(title),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.green,
                      width: MediaQuery.of(context).size.width/2.8, // запомнить
                      height: MediaQuery.of(context).size.height/15,
                      child:FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        splashColor: Colors.blueAccent,

                        onPressed: (){},

                        child: Text('Similar',
                          style: TextStyle(fontSize: 20.0),),)
                  ),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.green,
                      width: MediaQuery.of(context).size.width/2.8, // запомнить
                      height: MediaQuery.of(context).size.height/15,
                      child:FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        splashColor: Colors.blueAccent,

                        onPressed: (){},

                        child: Text('Go to shop',
                          style: TextStyle(fontSize: 20.0),),)
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

