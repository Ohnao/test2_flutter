import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final title = 'Flutter Sample App';

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Material layout',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.red,
      ),
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
          Container (
            child:
              Text(
                "Hello, Design!!",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                  ),
            ),
            padding:
              const EdgeInsets.all(10.0),
            alignment: Alignment.center,
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {setState(() => _islight = !_islight);},
          tooltip: 'You can change screen mode',
          child: _islight ? Icon(Icons.flare) : Icon(Icons.brightness_2),
        ),
      )
    );
  }
  void fabPressed(){}
}