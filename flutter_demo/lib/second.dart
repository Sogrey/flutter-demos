import 'package:flutter/material.dart';
class Second extends StatelessWidget {
  final title ;///页面标题

  const Second({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title==null?"Second Page":title),
      ),
      body: new Center(
        //onPressed  点击事件
        child: new RaisedButton(child: new Text("注销"), onPressed: () {
          //回到上一个页面 该pop将Route从导航器管理的路由栈中移除当前路径
          Navigator.pop(context);
        }),
      ),
    );
  }
}