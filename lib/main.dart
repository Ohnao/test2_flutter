import 'dart:math';

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
        child: CustomPaint(
          painter: MyPaint(),
        ),
      ),
    );
  }
}

class MyPaint extends CustomPainter {
  @override
    void paint(Canvas canvas, Size size){
      Paint p = Paint();
      p.style = PaintingStyle.fill;
      p.color = Colors.black;
      print(size);
      for (var i = 0; i < 100; i++){
        Random rnd = Random();
        double w = rnd.nextInt(300).toDouble() -150;
        double h = rnd.nextInt(300).toDouble() -150;
        double cr = rnd.nextInt(50).toDouble();
        int r = rnd.nextInt(225);
        int g = rnd.nextInt(225);
        int b = rnd.nextInt(225);
        p.color = Color.fromARGB(50, r, g, b);
        canvas.drawCircle(Offset(w, h), cr, p);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}