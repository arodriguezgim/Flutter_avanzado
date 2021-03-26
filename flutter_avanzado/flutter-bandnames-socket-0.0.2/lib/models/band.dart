class Band {
  String id;
  String name;
  int votes;

  Band({this.id, this.name, this.votes});

// Es un constructor que recibe cierto tipo de argumentos y devuelve una instancia de la clase
  factory Band.fromMap(Map<String, dynamic> obj) {
    return Band(
      id: obj['id'],
      name: obj['name'],
      votes: obj['votes'],
    );
  }
}
