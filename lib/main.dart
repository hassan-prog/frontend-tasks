import 'package:flutter/material.dart';
import './widgets/register.dart';
import 'models/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: const Color(0x00ffcc9c),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Users> users = [];

  void _addNewUser(String username, String password) {
    // ignore: unused_local_variable
    final newUser = Users(username, password);
    setState(() {
      users.add(newUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Register(_addNewUser);
  }
}
