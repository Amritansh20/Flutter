import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationcController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationcController = new AnimationController(
        value: this, duration: new Duration(milliseconds: 500));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationcController, curve: Curves.easeOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationcController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("Asset/original.jpeg"),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlutterLogo(
                  size: _iconAnimation.value * 100,
                ),
                new Form(
                    child: Theme(
                        data: new ThemeData(
                            brightness: Brightness.dark,
                            primarySwatch: Colors.teal,
                            inputDecorationTheme: new InputDecorationTheme(
                                labelStyle: new TextStyle(
                              color: Colors.teal,
                              fontSize: 20.0,
                            ))),
                        child: Container(
                          padding: const EdgeInsets.all(60.00),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new TextFormField(
                                decoration: new InputDecoration(
                                    labelText: "Enter Username"),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new TextFormField(
                                decoration: new InputDecoration(
                                    labelText: "Enter Password"),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              new Padding(
                                  padding: const EdgeInsets.only(top: 40.0)),
                              new MaterialButton(
                                height: 40.0,
                                minWidth: 100.00,
                                color: Colors.teal,
                                textColor: Colors.white,
                                child: new Text("Login"),
                                onPressed: () => {},
                                splashColor: Colors.red,
                              )
                            ],
                          ),
                        )))
              ],
            )
          ],
        ));
  }
}
