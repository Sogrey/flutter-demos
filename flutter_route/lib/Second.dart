import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  final String title, content;
  final Color bgColor;

  const Second({Key key, this.title, this.content,this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          title == null ? "第二个页面默认标题" : title,
        ),
      ),
      body: new Center(
        child: new Text(
          content == null ? "第二个页面默认内容" : content,
        ),
      ),
      backgroundColor: bgColor??bgColor,
    );
  }
}