import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final Function addUser;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Register(this.addUser, {super.key});

  void onRegister() {
    if (_passwordController.text.isEmpty || _usernameController.text.isEmpty) {
      return;
    }
    final enteredUsername = _usernameController.text;
    final enteredPassword = _passwordController.text;

    addUser(enteredUsername, enteredPassword);
  }

  @override
  Widget build(BuildContext context) {
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
            width: 300,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: onRegister,
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
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
