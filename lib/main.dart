import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

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
  String _message = 'ok';
  bool _switch = true;
  double _slider = 0.0;

  void buttonPressed(){
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text("Hello"),
        content: const Text("This is sample"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop<String>(context, 'cancel')
          ),
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop<String>(context, 'OK')
          ),
        ],
      ),
    ).then<void>((value) => resultAlert(value));
  }

  void resultAlert(String value){
    setState(() {
      _message = 'selected $value';
    });
  }

  void showPicker(){
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context){
        return CupertinoPicker(
          backgroundColor: CupertinoColors.black,
          itemExtent: 50.0,
          children: <Widget>[
            Text(
              'One',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              'Two',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              'Three',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              'Four',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              'Five',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
          onSelectedItemChanged: (int value){
            print('pick $value');
          },
        );
      },
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
          backgroundColor: Color.fromARGB(255, 235, 235, 235),
          appBar: AppBar(
            title: Text('Qupertino layout App'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              CupertinoSwitch(
                value: _switch,
                onChanged: (bool value){
                  setState(() {
                    _switch = value;
                    _message = 'switch $_switch';
                  });
                },
              ),
              CupertinoSlider(
                value: _slider,
                min: 0.0,
                max: 1.0,
                divisions: 100,
                onChanged: (double value){
                  setState(() {
                    _slider = value;
                    _message = 'slider $_slider';
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  pressedOpacity: 0.5,
                  color: CupertinoColors.activeBlue,
                  onPressed: buttonPressed,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "tap this",
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: CupertinoNavigationBar(
            leading: Icon(CupertinoIcons.left_chevron),
            middle: Text('Navigation'),
            trailing: IconButton(
              icon: Icon(CupertinoIcons.right_chevron),
              onPressed: showPicker,
            ),
          ),
    );
  }
}