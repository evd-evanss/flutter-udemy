
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
  return Builder(builder: (BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RedButton("estático", () => _onClickNavigator(context, PageOne())),
            RedButton("dinâmico", () => _onClickNavigator(context, PageTwo())),
            RedButton("GridView", () => _onClickNavigator(context, PageThree())),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RedButton("SnackBar", () => _showToast(context)),
            RedButton("Dialog", () => _onClickDialog(context))

          ],
        )
      ],
    );
  },);
}

_onClickDialog(context) {
  showDialog(context: context,  builder: (context) {

    return AlertDialog(
      title: Text("Flutter é muito legal"),
      actions: <Widget>[
        FlatButton(
          color: Colors.green,
          child: Text("Desistir"),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          color: Colors.red,
          child: Text("Cancelar"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  });
}

_onClickNavigator(BuildContext context, Widget page) async {

  String text = await push(context, page);
  print(text);

}

void _showToast(context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text("OK"),
      action: SnackBarAction(
        textColor: Colors.yellow,
          label: 'UNDO',
          onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

