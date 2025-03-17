import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shopping_list/models/products.dart';
import 'package:shopping_list/routes/routes.dart';
import 'package:shopping_list/widget/home/home.dart';
import 'package:sqflite/sqflite.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 194, 170, 147),
);



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'products_database.db'),
    onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, list_tag INTEGER)',
    );
  },
  version: 1,
  );
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.onPrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.onPrimaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.onPrimary,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.primary,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.primary,
            fontSize: 18,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.primary,
            fontSize: 16,
          ),
          bodyLarge: TextStyle(color: kColorScheme.primary, fontSize: 18),
          bodyMedium: TextStyle(color: kColorScheme.primary, fontSize: 16),
          bodySmall: TextStyle(color: kColorScheme.onPrimary, fontSize: 15),
        ),
      ),
      //themeMode: ThemeMode.system, // default
      home: HomeBody(),
      navigatorKey: Routes.rootNavigatorKey,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.PAGE_INITIAL,
    ),
  );
}
