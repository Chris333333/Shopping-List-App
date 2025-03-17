import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shopping_list/models/products.dart';
import 'package:sqflite/sqflite.dart';

class ProductsDatabase {
  static final ProductsDatabase _instance = ProductsDatabase._internal();
  static Database? _database;

  factory ProductsDatabase() {
    return _instance;
  }

  ProductsDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    WidgetsFlutterBinding.ensureInitialized();
    _database = await openDatabase(
      join(await getDatabasesPath(), 'products_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, list_tag INTEGER)',
        );
      },
      version: 1,
    );
    return _database!;
  }

  Future<void> insertProduct(Products product) async {
    final db = await database;
    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Products>> products() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Products(
        name: maps[i]['name'],
        listTag: maps[i]['list_tag'],
      );
    });
  }

  Future<void> updateProduct(Products product) async {
    final db = await database;
    await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.name],
    );
  }

  Future<void> deleteProduct(String name) async {
    final db = await database;
    await db.delete(
      'products',
      where: 'name = ?',
      whereArgs: [name],
    );
  }
}
