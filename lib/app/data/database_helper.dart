import 'package:flutter_contact_app/app/data/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;
  String dbName = "contacts.db";
  String tableName = "list_contact";

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper.internal();
    return _databaseHelper!;
  }

  DatabaseHelper.internal();

  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        namaDepan TEXT,
        namaBelakang TEXT,
        noTelepon TEXT
      )
      ''');
  }

  Future<int> insertContacts(Contact contact) async {
    Database db = await database;
    return await db.insert(
      tableName,
      contact.toMap(),
    );
  }

  Future<int> updateContacts(Contact contact, int id) async {
    Database db = await database;
    return await db.update(
      tableName,
      contact.toMap(),
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> deleteContacts(int id) async {
    Database db = await database;
    return await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<Contact>> getAllContacts() async {
    final Database db = await database;
    final List<Map<String, dynamic>> contacts = await db.query(tableName);
    return List.generate(
      contacts.length,
      (i) {
        return Contact(
          id: contacts[i]['id'],
          namaDepan: contacts[i]['namaDepan'],
          namaBelakang: contacts[i]['namaBelakang'],
          noTelepon: contacts[i]['noTelepon'],
        );
      },
    );
  }
}
