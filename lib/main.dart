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
  List _items = <Widget>[];

  @override
  void initState(){
    super.initState();
    for (var i = 0; i < 10; i++){
      var item = Container(
        color: i.isOdd ? Colors.blue : Colors.white,
        height: 100.0,
        child: Center(
          child: Text(
            'No, $i',
            style: const TextStyle(fontSize: 32.0),
          ),
        ),
      );
      _items.add(item);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(
            title: Text('Material layout App'),
            leading: BackButton(
              color: Colors.white,
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('sliver'),
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'images/planet.jpg',
                        fit:BoxFit.fill,
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.android),
                    tooltip: 'icon button',
                    onPressed: (){ print('pressed');},
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(_items),
              )
            ],
          )
    );
  }
}