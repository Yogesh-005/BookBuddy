import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/book.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  DatabaseService._internal();

  factory DatabaseService() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'bookbuddy.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE wishlist(
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        author TEXT NOT NULL,
        imageUrl TEXT,
        description TEXT
      )
    ''');
  }

  Future<void> addToWishlist(Book book) async {
    final db = await database;
    await db.insert(
      'wishlist',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Book>> getWishlist() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('wishlist');
    return List.generate(maps.length, (i) => Book.fromMap(maps[i]));
  }

  Future<void> removeFromWishlist(String bookId) async {
    final db = await database;
    await db.delete('wishlist', where: 'id = ?', whereArgs: [bookId]);
  }

  Future<bool> isInWishlist(String bookId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'wishlist',
      where: 'id = ?',
      whereArgs: [bookId],
    );
    return maps.isNotEmpty;
  }
}
