// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, camel_case_types, must_be_immutable
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:math' as math;

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
  int buffer = 0;
  Map<int,Widget>drawerData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      floatingActionButton: FloatingActionButton(onPressed:
           (){ showDialog(context: context,
              builder: (_)=>AlertDialog(
                title: const Text("enter name of the file"),
                content: TextField(
                  onSubmitted:(value) => setState(() { 
                    buffer++;
                    drawerData.addAll( { buffer:Card(value: value) } );
                    Navigator.pop(context);
                  })
               ),
              ));},
            child: const Icon(Icons.add),),
      body: GridView.count(crossAxisSpacing: 10,mainAxisSpacing: 10,crossAxisCount: 5,children:drawerData.values.toList(),)
    );
  }
}

class Card extends StatelessWidget {
  final String value;
  const Card({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 150,height: 150,
    child:GridTile(child: GestureDetector(
      child: Container(
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      width: 150,
      height: 150,
      padding: EdgeInsets.all(16),
      child:Center(child:Text(value)),), 
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => Note(text: value))));},)
  ),);
  }
}



class Note extends StatelessWidget {
  final String text;
  const Note({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(text)
      )
    );
  }
}