import 'package:firebase_database/firebase_database.dart';
import 'user_model.dart';

class DatabaseService {
  // Use a getter to ensure Firebase is initialized before access
  DatabaseReference get _dbRef => FirebaseDatabase.instance.ref('users');

  // Note: If you have a custom database URL (non-US region), use:
  // DatabaseReference get _dbRef => FirebaseDatabase.instanceFor(
  //   app: Firebase.app(),
  //   databaseURL: 'https://your-project-id.firebaseio.com',
  // ).ref('users');

  // Create
  Future<void> addUser(UserModel user) async {
    await _dbRef.push().set(user.toJson());
  }

  // Read
  Stream<List<UserModel>> getUsers() {
    return _dbRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return [];

      return data.entries.map((e) {
        return UserModel.fromJson(e.key, e.value as Map<dynamic, dynamic>);
      }).toList();
    });
  }

  // Update
  Future<void> updateUser(UserModel user) async {
    if (user.id != null) {
      await _dbRef.child(user.id!).update(user.toJson());
    }
  }

  // Delete
  Future<void> deleteUser(String id) async {
    await _dbRef.child(id).remove();
  }
}
