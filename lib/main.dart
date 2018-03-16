import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();

}


class _State extends State<MyApp>{

  String _lastPress ='never';

  void _onPressed(){
    print('Pressed');
    setState((){
      DateTime pressedTime = new DateTime.now();
      _lastPress = pressedTime.toString();
    });
  }

  @override

  Widget build(BuildContext context){
    return new  Scaffold(
      appBar: new AppBar(
        title: new Text('Drawer & Floating Button in Flutter')
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: (){_onPressed();},
        child: new Icon(Icons.mail),
        backgroundColor: Colors.teal,
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[
              new Text('Menu'),
              new RaisedButton(
                color: Colors.lightBlue,
                child: new Text('Close Menu'),
                onPressed: (){Navigator.pop(context);},
              )
            ],
          )
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Last Pressed ${_lastPress}')
          ],
        ),
      ),

    );
  }

}