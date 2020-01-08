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
  String _message;
  String _message2;
  String _message3;
  String _stars = "";
  int _star = 2;
  int _index = 0;
  int _index2;

  @override
  void initState(){
    _message = 'ok';
    _message2 = 'stay';
    _message3 = 'stand by';
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(
            title: Text('Material layout App'),
            leading: BackButton(
              color: Colors.white,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.android),
                tooltip: 'add star',
                onPressed: iconPressedA,
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                tooltip: 'subtract star',
                onPressed: iconPressedB,
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30.0),
              child: Center(
                child:
                  Text(_stars,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
              ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('bottom'),
              icon: Icon(Icons.android),
            ),
            BottomNavigationBarItem(
              title: Text('bottom'),
              icon: Icon(Icons.favorite),
            ),
          ],
          onTap: tapBottomIcon,
        ),
        body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _message,
                style: const TextStyle(
                  fontSize: 28.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Text(
                _message2,
                style: const TextStyle(
                  fontSize: 28.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Text(
                _message3,
                style: const TextStyle(
                  fontSize: 28.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: const Text('First choice'),
                    selected: _index2 == 1,
                    onTap: () {
                      _index2 = 1;
                      tapTile();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.android),
                    title: const Text('Second choice'),
                    selected: _index2 == 2,
                    onTap: () {
                      _index2 = 2;
                      tapTile();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_border),
                    title: const Text('Third choice'),
                    selected: _index2 == 3,
                    onTap: () {
                      _index2 = 3;
                      tapTile();
                    },
                  ),
                ],
              )
            ]
          ),
    );
  }
  void iconPressedA(){
    _message = 'tap "android".';
    _star++;
    update();
  }

  void iconPressedB(){
    _message = 'tap "favorite".';
    _star--;
    update();
  }

  void update(){
    _star = _star < 0 ? 0 : _star > 5 ? 5 : _star;
    setState(() {
      _stars = '★★★★★☆☆☆☆☆'.substring(5 - _star, 5 - _star + 5);
      _message = _message + '[$_star]';
    });
  }

  void tapBottomIcon(int value){
    var items = ['Android', 'Heart'];
    setState(() {
      _index = value;
      _message2 = 'You tapped "'+ items[_index] + '"';
    });
  }

  void tapTile(){
    setState(() {
      _message3 = 'You tapped No, $_index2';
    });
  }
}