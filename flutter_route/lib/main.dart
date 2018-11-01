import 'package:flutter/material.dart';
import 'package:flutter_route/Second.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      routes: { ///静态注册路由，不能传递参数
        "SecondPage": (BuildContext context) => new Second()
      },
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new MyRaisedButton(
              text: "静态路由跳转",
              textColor: Colors.white,
              bgColor: Colors.blue,
              onTap: () {
                ///方法一 - 静态路由，这种路由的缺点是不能传递参数。
                Navigator.pushNamed(context, "SecondPage");
              },
            ),
            new MyRaisedButton(
              text: "动态路由无参",
              textColor: Colors.white,
              bgColor: Colors.blue,
              onTap: () {
                ///方法二 - 动态路由无参
                //跳转到新的 页面我们需要调用 navigator.push方法  -
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Second()
                    )
                );
              },
            ),
            new MyRaisedButton(
              text: "动态路由有参",
              textColor: Colors.white,
              bgColor: Colors.blue,
              onTap: () {
                ///方法三 - 动态路由有参
                //跳转到新的 页面我们需要调用 navigator.push方法  -
                Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) {
                          return new Second(
                            title: "第二个页面新标题",
                            content: "第二个页面新内容",
                            bgColor: Colors.blue,
                          );
                        }
                    )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

///自定义按钮
class MyRaisedButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color bgColor, textColor;
  final String text;

  const MyRaisedButton(
      {Key key, this.onTap, this.bgColor, this.textColor, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(0.0),
      margin: new EdgeInsets.all(5.0),
      child: new Material(
        color: bgColor,
        child: new InkWell(
          onTap: onTap,
          child: new Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            child: new Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}