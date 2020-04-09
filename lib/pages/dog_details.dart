
import 'package:aula01/utils/Dog.dart';
import 'package:flutter/material.dart';

class DogDetails extends StatelessWidget {

  final Dog dog;

  const DogDetails(this.dog);

  @override
  Widget build(BuildContext context) {
    print(dog.foto);

    return Scaffold(
      appBar: AppBar(
          title: Text(dog.nome),
      ),
      body: Container(
          color: Colors.yellow,
          child: Image.asset("assets/images/${dog.foto}"),
          ),
    );
  }
}
