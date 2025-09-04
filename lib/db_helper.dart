import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> initDb() async {
    final path = join(await getDatabasesPath(), 'entries.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE entries (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            date TEXT,
            time TEXT
          )
        ''');
      },
    );
  }

  static Future<void> insertEntry(String title, String description) async {
    final db = await initDb();
    final now = DateTime.now();
    await db.insert('entries', {
      'title': title,
      'description': description,
      'date': '${now.year}-${now.month}-${now.day}',
      'time': '${now.hour}:${now.minute.toString().padLeft(2, '0')}',
    });
  }

  static Future<List<Map<String, dynamic>>> getEntries() async {
    final db = await initDb();
    return db.query('entries', orderBy: 'id DESC');
  }
}