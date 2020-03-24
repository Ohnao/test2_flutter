import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen('Second'),
        '/third': (context) => ThirdScreen('Third'),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => new _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List <String> list = ['あいうえお', 'かきくけこ', 'さしすせそ'];

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('First-Screen'),
      ),
      body: Row(
        children: <Widget>[
          Text(list[0]),
          Text(list[1]),
          Text(list[2]),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Next'),
            icon: Icon(Icons.navigate_next),
          ),
        ],
        onTap: (int value){
          if(value == 1)
            Navigator.pushNamed(
              context,
              '/second',
            );
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String _value;

  SecondScreen(this._value);

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('_value'),
      ),
      body: Center(
        child: Container(
          child: Text('You typed $_value'),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('prev'),
            icon: Icon(Icons.navigate_before),
          ),
          BottomNavigationBarItem(
            title: Text('?'),
            icon: Icon(Icons.android),
          ),
        ],
        onTap: (int value){
          if(value == 0) Navigator.pop(context);
          if (value == 1)
            Navigator.pushNamed(context, '/third');
        },
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  final String _value;

  ThirdScreen(this._value);

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(_value),
      ),
      body: Row(
        children: <Widget>[
            Text('あいうえお'),
            Text('かきくけこ'),
            Text('さしすせそ'),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('prev'),
            icon: Icon(Icons.navigate_before),
          ),
          BottomNavigationBarItem(
            title: Text('?'),
            icon: Icon(Icons.android),
          ),
        ],
        onTap: (int value){
          if(value == 0) Navigator.pop(context);
        },
      ),
    );
  }
}