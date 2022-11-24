import 'package:flutter/material.dart';
import 'package:flutter_task/main.dart';

import 'login_screen.dart';
import '../models/users.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register-screen';

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void onRegister(BuildContext ctx, List myUsers) {
    final enteredUsername = _usernameController.text;
    final enteredPassword = _passwordController.text;
    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      return;
    }

    var newUser = Users(enteredUsername, enteredPassword);
    myUsers.add(newUser);

    Navigator.of(ctx).pushNamed(LoginScreen.routeName, arguments: myUsers);
  }

  void handleLogin(BuildContext ctx, List myUsers) {
    Navigator.of(ctx).pushNamed(LoginScreen.routeName, arguments: myUsers);
  }

  @override
  Widget build(BuildContext context) {
    final myUsers = ModalRoute.of(context)?.settings.arguments as List;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Register',
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
                      onSubmitted: (_) => onRegister(context, myUsers),
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      controller: _passwordController,
                      onSubmitted: (_) => onRegister(context, myUsers),
                      obscureText: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              const Text(
                                'Already have an account ?',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              TextButton(
                                onPressed: () => handleLogin(context, myUsers),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => onRegister(context, myUsers),
                                child: const Text(
                                  'Sign up',
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
