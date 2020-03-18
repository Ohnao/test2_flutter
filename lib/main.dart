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

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Home Screen',
            style: TextStyle(
              fontSize: 32.0,
              color: const Color(0xFF000000),
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto",
            ),
          ),
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