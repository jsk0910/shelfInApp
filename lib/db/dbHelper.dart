import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/Book.dart';

class dbHelper {
  late Database? _database;

  // get Database From local
  Future<Database?> get database async {
    _database = await initDB();
    return _database;
  }

  // initialize database from local path
  initDB() async {
    String path = join(await getDatabasesPath(), 'ShelfInApp.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          Create TABLE Book(
            SEQ INTEGER PRIMARY KEY AUTOINCREMENT,
            TITLE TEXT NOT NULL,
            CONTENTS TEXT,
            ISBN TEXT,
            PUB_DATE TEXT,
            AUTHOR TEXT,
            PUBLISHER TEXT,
            TRANSLATOR TEXT,
            PRICE TEXT,
            CATEGORY TEXT,
            BUY_DATE TEXT,
            POSTER TEXT,
            MEMO TEXT,
            SHELF TEXT,
            RATING TEXT,
            REG_DATE TEXT
           );
        '''
        );
        await db.execute('''
          Create TABLE Category(
            CATEGORY TEXT PRIMARY KEY NOT NULL,
            SORT INTEGER,
            REG_DATE TEXT
          );
        ''');
        await db.execute('''
          Create TABLE Shelf(
            SHELF TEXT PRIMARY KEY NOT NULL,
            SORT INTEGER,
            REG_DATE TEXT
          );
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) {}
    )
  }

  /* Access to Database (CRUD)
      With Sqflite
  */
  // Book Start

    // get All from Database (SELECT *)
  Future<List<Book>> getAllBook() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('Book');
    if (maps.isEmpty) return [];
    List<Book> list = List.generate(maps.length, (index) => {
      return Book.fromMap(maps[index]);
    });

    return list;
  }

  // get books with Word
  Future<List<Book>> getBookFromW(String w, String targetArgs) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db?.query('Book', where: w + ' = ?', whereArgs: [targetArgs]);
    if (maps.isEmpty) return [];
    List<Book> list = List.generate(maps.length, (index) => {
      return Book.fromMap(maps[index]);
    });
    return list;
  }

    // insert
  Future<void> insert(Book book) async {
    final db = await database;
    book.Seq = await db?.insert('Book', book.toMap());
  }

  Future<void> update(Book book) async {
    final db = await database;
    await db?.update('Book', book.toMap(), where: "SEQ = ?", whereArgs: [book.Seq]);
  }

  Future<void> delete(Book book) async {
    final db = await database;
    await db?.delete('Book', where: "SEQ = ?", whereArgs: [book.Seq]);
  }

  // Book end
}