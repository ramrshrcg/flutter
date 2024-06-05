import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';

var kColourScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
//MAKING DARKMODE OR LIGHT MODE
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      // ignore: deprecated_member_use
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
        ),
         elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColourScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),

      theme: ThemeData().copyWith(
        colorScheme: kColourScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColourScheme.onPrimaryContainer,
          foregroundColor: kColourScheme.primaryContainer,
        ),
       
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColourScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      themeMode: ThemeMode.system, //default

      home: const Expenses(),
    ),
  );
}
