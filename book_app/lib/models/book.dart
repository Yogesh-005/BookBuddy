class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final String description;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    var volumeInfo = json['volumeInfo'] ?? {};
    var authors = volumeInfo['authors'] as List<dynamic>?;
    var imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic>?;

    return Book(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? 'Unknown Title',
      author: authors?.isNotEmpty == true ? authors!.first : 'Unknown Author',
      imageUrl: imageLinks?['thumbnail'] ?? '',
      description: volumeInfo['description'] ?? 'No description available',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
    );
  }
}