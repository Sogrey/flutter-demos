import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter 示例',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter 示例主页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Card(
          color: Colors.blue,
          child: new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  'You have pushed the button this many times:',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: _counter.toDouble(),
                  ),
                ),
                new Text(
                  '$_counter',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display3,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
      new MyButton(
        onTap: _incrementCounter,
      ),
//      new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ),
    );
  }
}
///自定义一个Button控件
class MyButton extends StatelessWidget {

  final VoidCallback onTap;

  MyButton({
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return new Material(
      borderRadius: new BorderRadius.circular(8.0),
      color: Colors.red,
      child: new InkWell(
        onTap: onTap,
        child: new Container(
          padding: const EdgeInsets.all(16.0),
          child: new Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
