
import 'package:aula01/pages/page_one.dart';
import 'package:aula01/pages/page_two.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/red_button.dart';
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
      child: _columm(context),
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

_button(text, context, Function onPressed) {
  return RedButton(text, onPressed);
}
_columm(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _text(),
      _pager_view(),
      _buttons(context)
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

 _buttons(context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RedButton("Tela 1", () => _onClickNavigator(context, Page_One())),
        RedButton("Tela 2", () => _onClickNavigator(context, Page_Two()))
      ],
    );
}

_onClickNavigator(BuildContext context, Widget page) async {

  String text = await push(context, page);
  print(text);

}

void _showToast(BuildContext context, text) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to favorite'),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

