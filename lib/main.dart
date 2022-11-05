import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _colorSwitch = false;
  final _color = Colors.greenAccent;
  int w = 0 ,h = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        Stack( children: <Widget>[
          Positioned(left: 0,child: Container(width: 100,height: 1080, color:_colorSwitch? Colors.green : Colors.red,)),
          Positioned(left: 0,child: TextButton(child:  const Text('press me'), onPressed: (){setState(() {
            _colorSwitch = !_colorSwitch;
          });},)), //Левая часть экрана  
          Positioned(right: 20,child: Draggable<Color>(
              feedback: Container(width: 100,height: 100,color: Colors.white,),
              childWhenDragging: Container(width: 100,height: 100,color: Colors.black,),
              child: Container(width: 100,height: 100,color: Colors.green,))),
          Positioned( left: 200,child: DragTarget<Color>(
             builder: (context,_,__)=>Container(width: 100,height: 100,color: Colors.black,),
             onAccept: ((data) => setState(()=> _color)),
             ))
    ],), 
    );
  }
}


class Card extends StatefulWidget {
  
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}


class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}