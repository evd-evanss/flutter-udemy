import 'package:aula01/widgets/red_button.dart';
import 'package:flutter/material.dart';

class Page_Two extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child:  AppBar(
          title: Text('Tela 2', textAlign: TextAlign.center,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  return Center(
    child: RedButton("Voltar", () => Navigator.pop(context, "Tela 2")),
  );
}
