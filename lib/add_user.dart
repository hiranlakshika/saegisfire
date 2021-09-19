import 'package:flutter/material.dart';
import 'package:saegisfire/models/user_model.dart';

import 'firestore_controller.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _address = TextEditingController();
  FirestoreController _firestoreController = FirestoreController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(labelText: 'name'),
                ),
                TextFormField(
                  controller: _age,
                  decoration: InputDecoration(labelText: 'age'),
                ),
                TextFormField(
                  controller: _address,
                  decoration: InputDecoration(labelText: 'address'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var user = User(_name.text, _address.text, int.parse(_age.text));
                    _firestoreController.addUser(user);
                  },
                  child: Text('Add user'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var docId = await _firestoreController.getDocId('Dave');
                    _firestoreController.updateAddress('Ragama', docId!);
                  },
                  child: Text('Update user'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var docId = await _firestoreController.getDocId('Dave');
                    _firestoreController.deleteUser(docId!);
                  },
                  child: Text('Delete user'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
