import 'package:flutter/material.dart';

class Page_One extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 1"),
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  return Column(
    children: <Widget>[
      Expanded(
        flex: 1,
          child: PageView(
            children: <Widget>[
              _img("dog_one.jpg"),
              _img("dog_two.jpg"),
              _img("dog_three.jpg"),
              _img("dog_four.jpg"),
              _img("dog_five.jpg"),
            ],
          ),
      ),
      Expanded(
        flex: 3,
        child: ListView(
          children: <Widget>[
            _img("dog_one.jpg"),
            _img("dog_two.jpg"),
            _img("dog_three.jpg"),
            _img("dog_four.jpg"),
            _img("dog_five.jpg"),
          ],
        ),
      ),

    ],
  );
}

_img(path) {
  return Container(
    child: Center(
      child: Image.asset(
        "assets/images/$path",
        width: 300,
        height: 300,
      ),
    ),
  );
}
