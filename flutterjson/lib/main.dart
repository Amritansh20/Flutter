// ignore: unused_import
import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("load Json App"),
        ),
        body: new Container(
          child: new Center(
            child: new FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/person.json'),
              builder: (context, snapshot) {
                var mydata = json.decode(snapshot.data.toString());
                return new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text("Name:" + mydata[index]['Name']),
                            new Text("Age:" + mydata[index]['Age']),
                            new Text("Height:" + mydata[index]['Height']),
                            new Text("Gender:" + mydata[index]['Gender']),
                            new Text(
                                "hair_Color:" + mydata[index]['hair_color']),
                          ]),
                    );
                    itemCount:
                    mydata == null ? 0 : mydata.length;
                  },
                );
              },
            ),
          ),
        ));
  }
}
