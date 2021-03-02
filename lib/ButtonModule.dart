import 'package:flutter/material.dart';
class ButtonPanel extends StatefulWidget{
  @override
  _ButtonPanelState createState(){
    return _ButtonPanelState();
  }
}

class _ButtonPanelState extends State<ButtonPanel>{
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        Container(
            color: Colors.green,
            width: MediaQuery.of(context).size.width/2.5,
            height: MediaQuery.of(context).size.height/1.1,
            child:FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              splashColor: Colors.blueAccent,

              onPressed: (){},

              child: Text('New Set',
                style: TextStyle(fontSize: 20.0),),)
        ),
        Container(
            color: Colors.green,
            width: MediaQuery.of(context).size.width/2.5, // запомнить
            height: MediaQuery.of(context).size.height/1.1,
            child:FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              splashColor: Colors.blueAccent,

              onPressed: (){},

              child: Text('Options',
                style: TextStyle(fontSize: 20.0),),)
        ),
      ],
    );
  }
}