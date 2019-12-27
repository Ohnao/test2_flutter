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
  var _gridData = <Widget> [
    Container(
      color: Colors.pink,
      width: 200.0,
      height: 200.0,
      child: Text(
        "One",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto"
        ),
      ),
    ),
    Container(
      color: Colors.green,
      width: 200.0,
      height: 200.0,
      child: Text(
        "Two",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto"
        ),
      ),
    ),
    Container(
      color: Colors.blue,
      width: 200.0,
      height: 200.0,
      child: Text(
        "Tree",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto"
        ),
      ),
    ),
    Container(
      color: Colors.yellow,
      width: 200.0,
      height: 200.0,
      child: Text(
        "four",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto"
        ),
      ),
    ),
  ];

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
          GridView.count (
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            padding: const EdgeInsets.all(10.0),
            children: _gridData,
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