import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

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
  GlobalKey _homeStateKey = GlobalKey();
  Offset _pos;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'App Name',
        ),
      ),
      body: Center(
        child: Listener(
          onPointerDown: _pointerDown,
          onPointerMove: _pointerMove,
          child: CustomPaint(
            key: _homeStateKey,
            painter: MyPainter(_pos),
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
            ),
          ),
        ),
      ),
    );
  }

  void _pointerDown(PointerDownEvent event){
    RenderBox referenceBox = _homeStateKey.currentContext.
      findRenderObject();
    setState((){
      _pos = referenceBox.globalToLocal(event.position);
    });
  }

  void _pointerMove(PointerMoveEvent event){
    RenderBox referenceBox = _homeStateKey.currentContext.
      findRenderObject();
    setState(() {
      _pos = referenceBox.globalToLocal(event.position);
    });
  }
}

class MyPainter extends CustomPainter{
  Offset _pos;
  MyPainter(this._pos);

  @override
  void paint(Canvas canvas, Size size){
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(25, 255, 0, 0);
    if (_pos != null){
      for(var i = 0; i < 10; i++){
        canvas.drawCircle(_pos, 10.0 * i, p);
      }
      canvas.drawCircle(_pos, 50.0, p);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}