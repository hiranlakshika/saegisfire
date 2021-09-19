import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saegisfire/models/user_model.dart';

class FirestoreController {
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) {
    return _users
        .add({
          'name': user.name,
          'age': user.age,
          'address': user.address,
        })
        .then((value) => print('User added'))
        .catchError(
          (error) => print('Failed to add user'),
        );
  }

  Future<String?> getDocId(String name) async {
    String? docId;
    await _users.where('name', isEqualTo: name).get().then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.length > 0) {
        docId = querySnapshot.docs[0].id;
      }
    });
    return docId;
  }

  Future<void> updateAddress(String address, String docId) {
    return _users
        .doc(docId)
        .update({'address': address})
        .then((value) => print('User updated'))
        .catchError((error) => print('Failed to update'));
  }

  Future<void> deleteUser(String docId) {
    return _users
        .doc(docId)
        .delete()
        .then((value) => print('user deleted'))
        .catchError((error) => print('Failed to delete'));
  }
}
