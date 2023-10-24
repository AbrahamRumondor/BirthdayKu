import 'package:birthdayku/views/authentication_screen.dart';
import 'package:flutter/material.dart';

// views

void main() {
  runApp(
    MaterialApp(
      title: 'BirthdayKu',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(128, 0, 32, 1)),
      ),
      home: const Scaffold(body: AuthenticationScreen()),
    ),
  );
}
