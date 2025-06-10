class Client {
  int id;
  String name;
  String lastname;
  String email;

  Client({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {"ID": id, "NAME": name, "LASTNAME": lastname, "EMAIL": email};
  }
}
