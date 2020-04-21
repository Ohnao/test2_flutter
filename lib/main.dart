import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/semantics.dart';

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

class Texts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('ほげほげ'),
          Text('ほげほげ'),
          Text('ほげほげ'),
        ],
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

Widget getTexts (List<String> strings) {
  List <Widget> list = List<Widget>();
  for(var i = 0; i < strings.length; i++) {
    list.add(Text(strings[i]));
  }
  return Row(children: list);
}

class _FirstScreenState extends State<FirstScreen> {
  List <String> lists = ['ほげほげ', 'ほげほげ', 'ほげほげ'];

  //@override
  //initState() {
  //  super.initState();
  //  lists = ['hogehoge', 'hogehoge', 'hogehoge'];
  //}

  //void setText(){
  //  setState(() {
  //    lists = ['bar', 'bar', 'bar'];
  //  });
  //}

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('First-Screen'),
      ),
      body: Container(
        child: Texts,
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: setText,
      //),
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