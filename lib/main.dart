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

  @override
  void initState(){
    _message = 'ok';
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
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: 120.0,
                  child: const Center(
                    child: Text(
                      'One',
                      style: const TextStyle(
                        fontSize: 32.0
                      )
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 120.0,
                  child: const Center(
                    child: Text(
                      'Two',
                      style: const TextStyle(
                        fontSize: 32.0
                      )
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  height: 120.0,
                  child: const Center(
                    child: Text(
                      'Three',
                      style: const TextStyle(
                        fontSize: 32.0
                      )
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 120.0,
                  child: const Center(
                    child: Text(
                      'Four',
                      style: const TextStyle(
                        fontSize: 32.0
                      )
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  height: 120.0,
                  child: const Center(
                    child: Text(
                      'Five',
                      style: const TextStyle(
                        fontSize: 32.0
                      )
                    ),
                  ),
                ),
                Container(
                  color: Colors.red,
                  height: 120.0,
                  child: const Center(
                    child: Text(
                      'Six',
                      style: const TextStyle(
                        fontSize: 32.0
                      )
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  height: 120.0,
                  child: const Center(
                    child: Text(
                      'Seven',
                      style: const TextStyle(
                        fontSize: 32.0
                      )
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }
}