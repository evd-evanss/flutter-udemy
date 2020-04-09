import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Estático"),
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  List<Image> imgs = [
    _img("dog_one.jpg"),
    _img("dog_two.jpg"),
    _img("dog_three.jpg"),
    _img("dog_four.jpg"),
    _img("dog_five.jpg")
  ];

  return ListView(
    itemExtent: 300,
    children: imgs,

  );
}

_img(path) {
  return Image.asset(
    "assets/images/$path",
    width: 300,
    height: 300,
    fit: BoxFit.cover,
  );
}

