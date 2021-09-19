import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    return Card(
                      child: Column(
                        children: [
                          Text((document.data()! as Map)['name']),
                          Text(((document.data()! as Map)['age']).toString()),
                          Text((document.data()! as Map)['address']),
                        ],
                      ),
                    );
                  }).toList(),
              );
            }
          }
      ),
    );
  }
}
