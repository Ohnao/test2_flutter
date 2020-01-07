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
  var _yourMessage;
  var _checkMessage;
  bool _checked = false;
  final controller = TextEditingController();

  @override
  void initState() {
    _yourMessage = 'String';
    _checkMessage = 'check';
    super.initState();
  }

  void textChanged(String val){
    setState(() {
      _yourMessage = 'You said ' + val.toUpperCase();
    });
  }

  void checkChanged(bool value){
    setState(() {
      _checked = value;
      _checkMessage = value ? 'checked' : 'not checked';
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
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      _yourMessage,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: textChanged,
                      controller: controller,
                      style: TextStyle(fontSize: 28.0,
                      color: const Color(0xFFF0000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text(
                      _checkMessage,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                  Switch(
                    value: _checked,
                    onChanged: checkChanged,
                  ),
                  Text(
                    "check",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    )
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