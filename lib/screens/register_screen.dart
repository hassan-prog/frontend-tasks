import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register-screen';

  final Function addUser;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  RegisterScreen(this.addUser, {super.key});

  void onRegister() {
    if (_passwordController.text.isEmpty || _usernameController.text.isEmpty) {
      return;
    }
    final enteredUsername = _usernameController.text;
    final enteredPassword = _passwordController.text;

    addUser(enteredUsername, enteredPassword);
  }

  void handleLogin(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(LoginScreen.routeName, arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Function;

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
                      onSubmitted: (_) => onRegister(),
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      controller: _passwordController,
                      onSubmitted: (_) => onRegister(),
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
                                onPressed: () => handleLogin(context),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: onRegister,
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
