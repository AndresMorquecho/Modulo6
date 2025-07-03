class Book {
  final int id;
  final String title;
  final String author;
  final String status;
  final String notes;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.status,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return ({
      'id': id,
      'title': title,
      'author': author,
      'status': status,
      'notes': notes,
    });
  }
}
