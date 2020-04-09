import 'package:aula01/pages/dog_details.dart';
import 'package:aula01/utils/Dog.dart';
import 'package:aula01/utils/nav.dart';
import 'package:flutter/material.dart';
bool _gridView = true;

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child:  AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.grid_on), onPressed: () => setState(() => _gridView = true)),
            IconButton(icon: Icon(Icons.grid_off), onPressed: () => setState(() => _gridView = false)),
          ],
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

onChangeStateGridView(state, gridView) {
  gridView = state;
}

_body(context) {

  List<Dog> dogs = [
    Dog("Jack", "dog_one.jpg"),
    Dog("Susy", "dog_two.jpg"),
    Dog("Totó", "dog_three.jpg"),
    Dog("Pepe", "dog_four.jpg"),
    Dog("Amora", "dog_five.jpg")
  ];

  if(_gridView) {
    return _buildGridView(context, dogs);
  } else {
    return _buildListView(context, dogs);
  }

}

_buildListView(context, dogs) {
  return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        return _itemView(context, dogs, index);
      });
}

_buildGridView(context, dogs) {
  return GridView.builder(
      itemCount: dogs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return _itemView(context, dogs, index);
      });
}

_itemView(context, dogs, index) {

  return GestureDetector(
    onTap: () => push(context, DogDetails(dogs[index])),
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _img(dogs[index].foto),
        _text(dogs[index].nome)
      ],
    ),
  );
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

