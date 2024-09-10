import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Position with ChangeNotifier {
  final String id;
  final String title;

  Position({required this.id, required this.title});
}

class Positions with ChangeNotifier {
  final List<Position> _list = [
    Position(id: 'l1', title: "Sex ustasi"),
    Position(id: "l2", title: "Brigadir"),
    Position(id: "l3", title: "Chilangar"),
    Position(id: "l4", title: "Tokar"),
    Position(id: "l5", title: "Ishchi"),
    Position(id: "l6", title: "Bo'yoqchi"),
    Position(id: "l7", title: "Elektr payvandchi"),
    Position(id: "l8", title: "Farrosh"),
  ];

  
List<Position> get list {
    return [..._list];
  }

Positions(){

}

  Future<void> _fetchDepartments() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('positions').get();
    // _list.clear(); // Очищаем список перед загрузкой

    for (var doc in querySnapshot.docs) {
      _list.add(
        Position(
          id: doc.id,
          title: doc['title'],
          
        ),
      );
    }
    notifyListeners();
  }

  void addPosition(Position newPosition) {
    _list.add(newPosition);
    notifyListeners();
    _addPositionToFirebase(newPosition);
  }

  Future<void> _addPositionToFirebase(Position position) async {
    try {
      await FirebaseFirestore.instance.collection('postions').add({
        'title': position.title,
       
      });
    } catch (error) {
      print("Failed to add position to Firebase: $error");
    }
  }

}
