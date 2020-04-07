import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Flutter',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
      child: _columm(),
  );
}

_text() {
  return Text('Dogs',
      style: TextStyle(
        fontSize: 22,
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        decorationStyle: TextDecorationStyle.double,
      ));
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

_button(text) {
  return ButtonTheme(
    child: RaisedButton(
      color: Colors.red,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print("Ok");
      },
    ),
  );
}

_columm() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _text(),
      _pager_view(),
      _buttons()
    ],
  );
}

 _pager_view() {
  return Container(
    margin: EdgeInsets.all(10),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("dog_one.jpg"),
          _img("dog_two.jpg"),
          _img("dog_three.jpg"),
          _img("dog_four.jpg"),
          _img("dog_five.jpg"),
        ],
      ),
    );
}

 _buttons() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _button("Anterior"),
        _button("Proximo")
      ],
    );
}
