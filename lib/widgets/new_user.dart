import 'package:flutter/material.dart';

import '../models/users.dart';

class NewUser extends StatefulWidget {
  final List myUsers;

  NewUser(this.myUsers, {super.key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObsecured = true;

  void showPassword() {
    setState(() {
      _isObsecured = !_isObsecured;
    });
  }

  void onSubmit() {
    final enteredUsername = _usernameController.text;
    final enteredPassword = _passwordController.text;

    if (enteredUsername.isEmpty || enteredPassword.isEmpty) {
      return;
    }
    var newUserObject = Users(enteredUsername, enteredPassword);

    widget.myUsers.add(newUserObject);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Username'),
                  ),
                  controller: _usernameController,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: _isObsecured,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    suffixIcon: IconButton(
                      icon: _isObsecured
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: showPassword,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onSubmit,
                  child: const Text('Add User'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
