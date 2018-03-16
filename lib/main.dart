import 'package:flutter/material.dart';
import 'dart:async';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();

}


class _State extends State<MyApp> with WidgetsBindingObserver {

  String _lastPress ='never';
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2015),
        lastDate: new DateTime(2020)
    );
    if(picked != null && picked != _date){
      print('Date Selected: ${_date.toString()}');
      setState((){
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async{
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time
    );
    if(picked != null && picked != _time){
      print('Time Selected: ${_time.toString()}');
      setState((){
        _time = picked;
      });
    }
  }

  void _onPressed(){
    print('Pressed');
    setState((){
      DateTime pressedTime = new DateTime.now();
      _lastPress = pressedTime.toString();
    });
  }
  @override
  void initState() {
    print('*** init state ***');
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    print('*** desposed***');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('*** state = ${state.toString()}');

    switch(state){
      case AppLifecycleState.inactive:
        print('*** inactive***');
        break;
      case AppLifecycleState.paused:
        print('*** paused***');
        break;
      case AppLifecycleState.resumed:
        print('*** resumed***');
        break;
      case AppLifecycleState.suspending:
        print('*** suspending***');
        break;
    }

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
            new Text('Last Pressed ${_lastPress}'),
            new Text('Date Selected: ${_date.toString()}'),
            new RaisedButton(
              child: new Text('Select Date'),
                onPressed: (){_selectDate(context);}),
            new Text('Time Selected: ${_time.toString()}'),
            new RaisedButton(
                child: new Text('Select Time'),
                onPressed: (){_selectTime(context);}),
          ],
        ),
      ),

    );
  }


}
