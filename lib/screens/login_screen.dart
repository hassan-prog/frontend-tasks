import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void onLogin() {
    if (_passwordController.text.isEmpty || _usernameController.text.isEmpty) {
      return;
    }
    final enteredUsername = _usernameController.text;
    final enteredPassword = _passwordController.text;
  }

  void handleRegister(BuildContext ctx) {
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
                      onSubmitted: (_) => onLogin(),
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      controller: _passwordController,
                      onSubmitted: (_) => onLogin(),
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
                                onPressed: onLogin,
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
