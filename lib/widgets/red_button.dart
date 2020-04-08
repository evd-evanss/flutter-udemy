import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedButton extends StatelessWidget{

  String text;
  Function onPressed;

  RedButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
          color: Colors.red,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPressed
      ),
    );
  }

}