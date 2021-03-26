import 'package:flutter/material.dart';
import 'package:your_brand/ProductInfo.dart';
import 'main.dart';
import 'package:firebase_storage/firebase_storage.dart';
class WearList extends StatefulWidget {
  @override
  _WearListState createState() {
    return _WearListState();
  }
}

class _WearListState extends State<WearList> {
  List<String> mock_list;
  int clothes;
  _WearListState () {
    mock_list= ["шапка.png","куртка.png","свитер.png","брюки.png","ботинки.png"];
    clothes= mock_list.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: clothes,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          return Container(
            child: InfoBlock(mock_list[index]),
          );
        },
      ),
    );
  }
}

class InfoBlock extends StatelessWidget {
  String title;
  InfoBlock(String t) {
    title = t;
  }
  Future<Image> _getImage(BuildContext context, String ImageName) async {
    Image image;
    await FireStorageService.loadImage(context, ImageName).then((value)
    {
      image = Image.network(
          value.toString(),
          fit: BoxFit.scaleDown
      );
    }
    );
    return image;
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
              child: FutureBuilder(
                future: _getImage(context, title),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return snapshot.data;
                    } else if (snapshot.hasError) {
                      return new Text("${snapshot.error}");
                    }
                  }

                  // By default, show a loading spinner
                  return new CircularProgressIndicator();
                },
              ),
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

class FireStorageService extends ChangeNotifier {
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}


