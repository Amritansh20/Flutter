import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      theme: new ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
          accentColor: Colors.red),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mytext = "Hello World";
  void _changeText() {
    setState(() {
      if (mytext.startsWith("H")) {
        mytext = "Welcome to flutter";
      } else {
        mytext = "Hello World";
      }
    });
  }

  Widget _bodywidget() {
    return new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              new Text(
                mytext,
                style: new TextStyle(color: Colors.indigo, fontSize: 25.0),
              )
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: _bodywidget(),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: _changeText,
      ),
    );
  }
}
