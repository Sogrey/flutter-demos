import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Second extends StatelessWidget {
  ///页面标题
  final String title;

  const Second({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title == null ? "Second Page" : title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(child: new Text("注销"), onPressed: () {
              //回到上一个页面 该pop将Route从导航器管理的路由栈中移除当前路径
              Navigator.pop(context);
//          Navigator.pop(context,"携带参数");
            }),

            new QrImage(
              data: "1234567890",
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}