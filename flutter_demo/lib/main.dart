import 'package:FlutterDemo/second.dart';
//import 'package:FlutterDemo/webview.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';//webview 插件

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
      routes: { //静态注册路由，不能传递参数
        "SecondPage": (BuildContext context) => new Second()
      },
//      routes: <String, WidgetBuilder>{
//        // 这里可以定义静态路由，不能传递参数
//        '/router/second': (_) => new Second(),
//      },
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
                new Image.network(
                  "https://10.url.cn/qqke_course_info/ajNVdqHZLLBj6T1tP44va445Ij0zrdK35YHzq435U6xZcrX162Jj51XH04mmvmFSNXkFsJCdwfA/",
                  scale: 1.0,

                  ///1.0不缩放
                  alignment: Alignment.center,
                ),
                new Text(
                    'You have pushed the button this many times:',
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: _counter.toDouble(),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        inherit: true,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                        decorationStyle: TextDecorationStyle.dotted,
                        letterSpacing: 2.0,
                        wordSpacing: 5.0
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1.0
                ),
                new Text(
                  '$_counter',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display3,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new MyButton(
                      bgColor: Colors.white,
                      iconColor: Colors.blue,
                      icon: Icons.link,
                      onTap: () {
                        ///方法一 - 无参
                        //跳转到新的 页面我们需要调用 navigator.push方法  -
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Second()
                            )
                        );
                      },
                    ),
                    new MyButton(
                      bgColor: Colors.white,
                      iconColor: Colors.blue,
                      icon: Icons.link,
                      onTap: () {
                        ///方法二 - 有参
                        //跳转到新的 页面我们需要调用 navigator.push方法  -
                        Navigator.push(context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return new Second(title: "第二个页面");
                                }));
                      },
                    ),
                    new MyButton(
                      bgColor: Colors.white,
                      iconColor: Colors.blue,
                      icon: Icons.link,
                      onTap: () {
                        ///方法二 - 这种路由的缺点是不能传递参数。
                        Navigator.pushNamed(context, "SecondPage");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
      new MyButton(
        icon: Icons.add,
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
  final Color bgColor;
  final Color iconColor;
  final IconData icon;

  MyButton({
    this.bgColor,
    this.icon,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return new Material(
      borderRadius: new BorderRadius.circular(8.0),
      color: bgColor == null ? Colors.red : bgColor,
      child: new InkWell(
        onTap: onTap,
        child: new Container(
          padding: const EdgeInsets.all(16.0),
          child: new Icon(
            icon,
            color: iconColor == null ? Colors.white : iconColor,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
