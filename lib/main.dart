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
  String _message;

  @override
  void initState(){
    _message = 'ok';
    super.initState();
  }

  void dialogPush(){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Column(
        children: <Widget>[
          Text(
            'This is Modal Bottom Sheat',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          FlatButton(
            onPressed: () => Navigator.pop<String>(context, 'Close'),
            child: Text(
              'Close',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: Colors.cyan,
              ),
            ),
          ),
        ],
      )
    ).then<void>((value) => resultAlert(value));
  }

  void resultAlert(String value){
    setState(() {
      _message = 'selected $value';
    });
  }

  @override Widget build(BuildContext context){
    return Theme(
      data: new ThemeData(
        brightness: _islight ? Brightness.light : Brightness.dark,
        primaryColor: Colors.pink[400],),
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
                children: <Widget>[
                  Text(
                    _message,
                    style: TextStyle(
                      fontSize: 32.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  RaisedButton(
                    onPressed: dialogPush,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "tap this",
                      style: TextStyle(
                        fontSize: 28.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                  )
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