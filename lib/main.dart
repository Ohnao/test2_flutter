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
        Center(
          child: Card(
            margin: EdgeInsets.all(50.0),
            color: Colors.pink,
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Hello!!!",
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  Text(
                    "This is Card layout",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"
                    ),
                  ),
                ]
              ),
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