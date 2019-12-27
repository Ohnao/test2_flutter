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
          Column (
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Container(
                    color: Color.fromARGB(225, 225, 125, 0),
                      child: Text(
                        'First item',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Container(
                    color: Color.fromARGB(225, 225, 25, 0),
                      child: Text(
                        'Second item',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                  ),
                ),
              ),
            ],
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