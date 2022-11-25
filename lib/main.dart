import 'package:flutter/material.dart';
import 'package:test/login.dart';
//import 'package:test/login.dart';
import 'package:test/register.dart';

import 'models/users.dart';

void main() => runApp(Login());
// A List of Current Users
final List<Users> users = [
  Users(id: 0, name: 'Ahmed', password: '0000'),
  Users(id: 1, name: 'Ali', password: '1234'),
  Users(id: 2, name: 'Sara', password: '4321'),
  Users(id: 3, name: 'X', password: '1111'),
];

//مش عارف دي زيادة ولا ايه -لو كده امسحها - *.*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      home: MyHomePage(),
      // theme: ThemeData(
      //   fontFamily: 'QuickSand',
      //   primaryColor: Colors.green,
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
      //       .copyWith(secondary: Colors.lightGreen),
      //   errorColor: Colors.red,
      // ),
      //debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //method to add a user that is activated when pressing (Add to Users) button in
  //modalBottomSheet:
  void addUser(int id, String name, String password) {
    final user = Users(id: id, name: name, password: password);
    setState(() {
      users.add(user);
    });
  }

  //method to take TextField values and passes them to addUser() method:
  void submitUser() {
    final enteredName = nameController.text;
    final enteredPassword = passwordController.text;
    addUser(users.length, enteredName, enteredPassword);
  }

  //method to delete a user that is activated when pressing on trash Icon:
  void delUser(int id) {
    users.removeWhere((element) => element.id == id);
    setState(() {
      // users.removeWhere((element) => element.id == id);
    });
  }

  //method to create a modaBottomSheet Widget:
  void modalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Column(
            children: [
              TextField(
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Name'),
                controller: nameController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Password'),
                controller: passwordController,
                onSubmitted: ((value) => submitUser),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: (() => submitUser()),
                  child: const Text('Add to Users'),
                ),
              ),
            ],
          );
        }));
  }

//كنت بجرب حوار ان لما ادوس على ال switch ده يظهره
  bool showPassword = true;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UsersApp',
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => modalBottomSheet(context),
              icon: const Icon(Icons.add),
            ),
          ],
          title: const Text('Home'),
        ),
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Users',
                  style: TextStyle(fontSize: 26),
                ),
                Text(
                  users.length.toString(),
                  style: const TextStyle(fontSize: 26),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.account_box_rounded,
                    size: 60,
                  ),
                  title: Text(users[index].name),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showPassword == true
                          ? Text(users[index].password)
                          : Text((users[index].password).hashCode.toString()),
                      Switch(
                        value: showPassword,
                        onChanged: ((val) {
                          showPassword = val;
                        }),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        delUser(users[index].id);
                      },
                      icon: const Icon(Icons.delete_forever_rounded)),
                );
              },
              itemCount: users.length,
            ),
          ),
        ]),
      ),
    );
  }
}
