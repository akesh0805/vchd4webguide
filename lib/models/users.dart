import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String id;
  final String fio;
  final String position;
  final String department;
  final String fingerprint;

  User({
    required this.id,
    required this.fio,
    required this.position,
    required this.department,
    required this.fingerprint,
  });

  Map<String, dynamic> toMap() {
    return {
      'fio': fio,
      'position': position,
      'department': department,
      'fingerprint': fingerprint,
    };
  }
}

class Users with ChangeNotifier {
  List<User> _list = [];

  List<User> get list {
    return [..._list];
  }

  Future<void> fetchAndSetUsers() async {
    try {
      final userSnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      _list = userSnapshot.docs.map((doc) {
        final data = doc.data();
        return User(
          id: doc.id,
          fio: data['fio'],
          position: data['position'],
          department: data['department'],
          fingerprint: data['fingerprint'],
        );
      }).toList();
      notifyListeners();
    } catch (error) {
      print('Failed to load users: $error');
    }
  }

  Future<void> addUser(User user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      _list.add(user);
      notifyListeners();
    } catch (error) {
      print('Failed to add user: $error');
    }
  }
}
