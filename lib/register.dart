import 'package:flutter/material.dart';
import 'package:test/login.dart';
import 'package:test/main.dart';

import 'models/users.dart';

class Register extends StatelessWidget {
  void addUser(int id, String name, String password) {
    final user = Users(id: id, name: name, password: password);
    users.add(user);
  }

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  void selectPage(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Username:'),
                controller: nameController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Password'),
                controller: passwordController,
                onSubmitted: ((value) => null),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: ElevatedButton(
                  onPressed: (() {
                    addUser(users.length, nameController.text,
                        passwordController.text);
                    print(users);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return MyHomePage();
                    }));
                  }),
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
