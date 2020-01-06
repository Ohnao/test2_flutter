import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final title = 'Flutter Sample App';

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _islight = true;
  var _message;
  static var _janken = <String>['Gu!!','Chi!!','Pa!!'];

  @override
  void initState() {
    _message = 'OK';
    super.initState();
  }

  void button(){
    setState(() {
      _message = (_janken..shuffle()).first;
    });
  }

  void buttonPressed(){
    setState(() {
      _message = 'Reset your game';
    });
  }

  @override
  Widget build(BuildContext context){
    return Theme(
      data: new ThemeData(
        brightness: _islight ? Brightness.light : Brightness.dark,
        primaryColor: Colors.pink[400],
      ),

      child: Scaffold(
        appBar: AppBar(
          title: Text('Material layout App'),
          ),
        body:
          Center(
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      _message,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  FlatButton(
                    key: null,
                    color: Colors.black54,
                    onPressed: button,
                    child:
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:
                          Text(
                            "Push this button",
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                            ),
                          ),
                      ),
                  ),
                  RaisedButton(
                    onPressed: buttonPressed,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.android,
                        size: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {setState(() => _islight = !_islight);},
            tooltip: 'You can change screen mode',
            child: _islight ? Icon(Icons.flare) : Icon(Icons.brightness_2),
          ),
      )
    );
  }
}