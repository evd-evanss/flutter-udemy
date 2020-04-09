import 'package:aula01/utils/Dog.dart';
import 'package:aula01/widgets/red_button.dart';
import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child:  AppBar(
          title: Text('GridView', textAlign: TextAlign.center,),
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
  List<Dog> dogs = [
    Dog("Jack", "dog_one.jpg"),
    Dog("Susy", "dog_two.jpg"),
    Dog("Totó", "dog_three.jpg"),
    Dog("Pepe", "dog_four.jpg"),
    Dog("Amora", "dog_five.jpg")
  ];

  //List View Dinamico
  return GridView.builder(
      itemCount: dogs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(dogs[index].foto),
            _text(dogs[index].nome)
          ],
        );
  });
}

_text(nome) {
  return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          nome,
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
          ),
        ),
      )
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

