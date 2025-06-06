import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class ApiService {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<Book>> searchBooks(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?q=$query&maxResults=20'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> items = data['items'] ?? [];
        return items.map((item) => Book.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      throw Exception('Error searching books: $e');
    }
  }

  Future<List<Book>> getPopularBooks() async {
    return await searchBooks('flutter programming');
  }
}