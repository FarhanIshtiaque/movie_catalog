import 'package:movie_catalog/features/home/data/movie_store.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalStorage{
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await init();
    return _database!;
  }
  init() async{

    String path = join(await getDatabasesPath(), "movies.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE movies (id INTEGER PRIMARY KEY, title TEXT, url TEXT)",
        );
      },
    );


  }

  Future<void> insertMovie(MovieData movieData) async {
    final db = await database;
    await db.insert('movies', movieData.toMap());
  }


  Future<List<MovieData>> getMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (i) {
      return MovieData.fromMap(maps[i]);
    });
  }





  Future<void> updateMovie(MovieData movie) async {
    final db = await database;
    await db.update(
      'movies',
      movie.toMap(),
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  Future<void> deleteMovie(int id) async {
    final db = await database;
    await db.delete(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


}