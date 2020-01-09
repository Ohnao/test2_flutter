import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

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
        child: MyRenderBoxWidget(),
      ),
    );
  }
}

class MyRenderBoxWidget extends SingleChildRenderObjectWidget{
  @override
  RenderObject createRenderObject(BuildContext context){
    return _MyRenderBox();
  }
}

class _MyRenderBox extends RenderBox {

  @override
  bool hitTest(HitTestResult result, {@required Offset position}) {
    return true;
  }

  @override
  void paint(PaintingContext context, Offset offset){
    Canvas c = context.canvas;
    int dx = offset.dx.toInt();
    int dy = offset.dy.toInt();

    Path path = Path();
    Rect r = Rect.fromLTWH(dx + 50.0, dy + 50.0, 75.0, 75.0);
    path.addOval(r);
    r = Rect.fromLTWH(dx + 75.0, dy + 75.0, 125.0, 125.0);
    path.addOval(r);
    r = Rect.fromLTWH(dx + 125.0, dy + 125.0, 175.0, 175.0);
    path.addOval(r);
    r = Rect.fromLTWH(dx + 125.0, dy + 125.0, 175.0, 175.0);
    path.addOval(r);

    c.save();

    Paint p = Paint();
    p.color = Color.fromARGB(150, 255, 0, 0);
    p.style = PaintingStyle.fill;
    c.drawPath(path, p);

    c.translate(0.0, 100.0);
    p.color = Color.fromARGB(150, 200, 0, 255);
    c.drawPath(path, p);

    p.color = Color.fromARGB(150, 0, 200, 0);
    c.rotate(-0.5 * pi);
    c.translate(-600.0, -250.0);
    c.scale(1 * 1.75);
    c.drawPath(path, p);

    c.restore();
  }
}