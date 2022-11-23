import 'package:flutter/material.dart';

import './screens/login_screen.dart';
import './screens/register_screen.dart';
import './models/users.dart';
import './widgets/new_user.dart';

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
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              // bodyText1: TextStyle(
              //   color: Color.fromRGBO(20, 51, 51, 1),
              // ),
              // bodyText2: TextStyle(
              //   color: Color.fromRGBO(20, 51, 51, 1),
              // ),
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleSmall: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),

      // home: MyHomePage(),
      routes: {
        '/': (ctx) => LoginScreen(),
        MyHomePage.homeRoute: (ctx) => const MyHomePage(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const homeRoute = '/myhomepage';
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    
void _showAddNewUser(BuildContext ctx, List myUsers) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewUser(myUsers);
      },
    );
  }
  

  void _dltUser(int index, List myUsers) {
    setState(() {
      myUsers.remove(myUsers[index]);
    });
  }

  void showPassword() {}

  

  void logout(BuildContext ctx) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final myUsers = ModalRoute.of(context)?.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        actions: [
          TextButton(
            onPressed: () => {logout(context)},
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
          // IconButton(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {
          //     _showAddNewUser(context);
          //   },
          // )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Users: ',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  '${myUsers.length}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.9,
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 36,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    myUsers[index].username,
                  ),
                  subtitle: Text(
                    myUsers[index].password,
                  ),
                  trailing: IconButton(
                    onPressed: () => _dltUser(index, myUsers),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              itemCount: myUsers.length,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNewUser(context, myUsers),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
