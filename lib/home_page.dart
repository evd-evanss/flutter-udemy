
import 'package:aula01/pages/page_one.dart';
import 'package:aula01/pages/page_three.dart';
import 'package:aula01/pages/page_two.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/red_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list), onPressed: () => print("icon lista clicado"),
          ),
          IconButton(
            icon: Icon(Icons.home), onPressed: () => print("icon home clicado"),
          ),
        ],
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
  return Column(
    children: <Widget>[
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RedButton("ListView estático", () => _onClickNavigator(context, PageOne())),
            RedButton("ListView dinâmico", () => _onClickNavigator(context, PageTwo()))
          ],
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RedButton("GridView", () => _onClickNavigator(context, PageThree())),
          RedButton("Tela X", () => _onClickNavigator(context, PageTwo()))
        ],
      )
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

