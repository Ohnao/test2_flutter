import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;

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
  ui.Image _img;

  @override
  bool hitTest(HitTestResult result, {@required Offset position}) {
    return true;
  }

  _MyRenderBox(){
    loadAssetImage('planet.jpg');
  }

  loadAssetImage(String fname) => rootBundle.load(
    "images/$fname"
  ).then((bd){
    Uint8List u8lst = Uint8List.view(bd.buffer);
    ui.instantiateImageCodec(u8lst).then((codec) {
      codec.getNextFrame().then(
        (frameInfo){
          _img = frameInfo.image;
          markNeedsPaint();
          print("_img created $_img");
        }
      );
    });
  });

  @override
  void paint(PaintingContext context, Offset offset){
    Canvas c = context.canvas;
    int dx = offset.dx.toInt();
    int dy = offset.dy.toInt();

    Paint p = Paint();
    Rect r = Rect.fromLTWH(dx + 50.0, dy + 50.0, 300, 300);
    if (_img != null){
      Rect r0 = Rect.fromLTWH(0.0, 0.0, _img.width.toDouble(), _img.height.toDouble());
      c.drawImageRect(_img, r0, r, p);
      print('draw _img');
    } else {
      print('-img is null');
    }

    c.save();
    r = Rect.fromLTWH(dx + 100.0, dy + 100.0, 200.0, 200.0);
    c.clipRect(r);
    c.drawColor(Color.fromARGB(255, 225, 0, 255), BlendMode.darken);
    c.restore();
    r = Rect.fromLTWH(dx + 170.0, dy + 180.0, 50.0, 50.0);
    c.clipRect(r);
    c.drawColor(Color.fromARGB(100, 0, 55, 155), BlendMode.darken);
    c.restore();
  }
}