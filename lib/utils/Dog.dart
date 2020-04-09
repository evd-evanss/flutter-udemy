class Dog {
  String nome;
  String foto;
  Dog(this.nome, this.foto);


  @override
  String toString() {
    return 'Dog{nome: $nome, foto: $foto}';
  }

}