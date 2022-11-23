import 'package:flutter/material.dart';

import 'register_screen.dart';
import '../models/users.dart';
import '../main.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';

  final List<Users> users = [
    Users('Hassan', 'asdasd'),
    Users('Mohamed', 'dsadsa'),
    Users('Ahmed', '123123'),
    Users('Ali', '321321'),
  ];

  LoginScreen({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void onLogin(BuildContext ctx) {
    final newUsersList = ModalRoute.of(ctx)!.settings.arguments as List;
    List lastList;
    if (newUsersList.isEmpty) {
      lastList = users;
    } else {
      lastList = newUsersList + users;
    }
    var enteredUsername = _usernameController.text;
    var enteredPassword = _passwordController.text;

    if (enteredPassword.isEmpty || enteredUsername.isEmpty) {
      return;
    }

    for (int i = 0; i < lastList.length; i++) {
      if (enteredUsername == lastList[i].username) {
        if (enteredPassword == lastList[i].password) {
          Navigator.of(ctx)
              .pushNamed(MyHomePage.homeRoute, arguments: newUsersList);
        }
      } else {
        return;
      }
    }
  }

  void handleRegister(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(RegisterScreen.routeName, arguments: users);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
          ),
        ),
        body: Center(
          child: SizedBox(
            height: 300,
            width: 350,
            child: Card(
              color: const Color.fromARGB(115, 253, 163, 59),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Username'),
                      controller: _usernameController,
                      onSubmitted: (_) => onLogin(context),
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      controller: _passwordController,
                      onSubmitted: (_) => onLogin(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              const Text(
                                'Dont have an account ?',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              TextButton(
                                onPressed: () => handleRegister(context),
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => onLogin(context),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
