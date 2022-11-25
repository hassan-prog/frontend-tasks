import 'package:flutter/material.dart';
import 'package:test/main.dart';
import 'package:test/register.dart';

import 'models/users.dart';

class Login extends StatelessWidget {
  Login({super.key});
// كنت بجرب حوار ال Navigation ده بس ضرب مني مش عارف  ليه وعمال يديني exception غريب كده
//ممكن لما نقعد مع بعض نضبط الدنيا
  void selectPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MyHomePage();
    }));
  }

// كنت بجرب حوار انه يتcheck للي بيعمل login بس برضه ضرب
  void checkLogin(BuildContext context) {
    // مش لاقي رقم احطه ف حطيت 7
    var x = Users(
        id: 7, name: nameController.text, password: passwordController.text);
    for (var i in users) {
      if (x.name != i.name && x.password != i.password) {
        print(x);
      } else {
        selectPage(context);
      }
    }
    return;
  }

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Center(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Username: ',
                    ),
                    controller: nameController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Password: ',
                    ),
                    controller: passwordController,
                  ),
                  const TextButton(
                    onPressed: null,
                    child: Text('Don\'t have an account?'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: ElevatedButton(
                      onPressed: (() => checkLogin(context)),
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
