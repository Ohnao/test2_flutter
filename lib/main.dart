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
  String _message;
  int _tapped = 0;

    @override
    void initState(){
      super.initState();
      _message = 'ok';
      for (var i = 0; i < 5; i++){
        var item = ListTile(
          leading: const Icon(Icons.android),
          title: Text('No, $i'),
          onTap: (){
            _tapped = i;
            tapItem();
          },
        );
        _items.add(item);
      }
    }

    void tapItem(){
      Navigator.pop(context);
      setState(() {
        _message = 'tapped [$_tapped]';
      });
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(
            title: Text('Material layout App'),
          ),
          body: Center(
            child: Text(
              _message,
              style: TextStyle(
                fontSize: 32.0,
              )
            ),
          ),
          drawer: Drawer(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: _items,
            ),
          ),
    );
  }
}