import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saegisfire/add_user.dart';
import 'package:saegisfire/auth_controller.dart';
import 'package:saegisfire/shared_pref_view.dart';
import 'package:saegisfire/user_list.dart';

import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Firebase'),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthController().logOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Shared Preferences'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveSharedPref(),
                ),
              ),
            ),
            ListTile(
              title: Text('Add User'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddUser(),
                ),
              ),
            ),
            ListTile(
              title: Text('Firestore Users'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsersList(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text('Home'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
