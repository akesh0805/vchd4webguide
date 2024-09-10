import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Department with ChangeNotifier {
  final String id;
  final String title;
  final String about;

  Department({
    required this.id,
    required this.title,
    required this.about,
  });
}

class Departments with ChangeNotifier {
  final List<Department> _list = [
    Department(id: 'b1', title: "Vagon yig'uv sexi", about: ""),
    Department(id: 'b2', title: "Telejka sexi", about: ""),
    Department(id: 'b3', title: "G'ildirak sexi", about: ""),
    Department(id: "b4", title: "Avtobirikma sexi", about: ""),
    Department(id: 'b5', title: "Avtotormoz nazorat bo'limi", about: ""),
    Department(id: 'b6', title: "Yordamchi tayyorlov sexi", about: ""),
    Department(id: 'b7', title: "Qo'qon VTXKB", about: ""),
    Department(id: 'b8', title: "Namangan VTXKB", about: ''),
    Department(id: "b9", title: "Axtachi VTXKB", about: ""),
    Department(id: "b10", title: "Oxunboboyev VTXKB", about: ""),
    Department(id: 'b11', title: "Oltiariq VTXKB", about: ""),
    Department(id: 'b12', title: "Pop - 2 VTXKB", about: ""),
    Department(id: 'b13', title: "Chodak VTXKB", about: ""),
    Department(id: 'b14', title: "Orzu VTXKB", about: "")
  ];

  List<Department> get list {
    return [..._list];
  }

 

  Departments() {
    _fetchDepartments();
  }

  Future<void> _fetchDepartments() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('departments').get();
    // _list.clear(); // Очищаем список перед загрузкой

    for (var doc in querySnapshot.docs) {
      _list.add(
        Department(
          id: doc.id,
          title: doc['title'],
          about: doc['about'],
        ),
      );
    }
    notifyListeners();
  }

  void addDepartment(Department newDepartment) {
    _list.add(newDepartment);
    notifyListeners();
    _addDepartmentToFirebase(newDepartment);
  }

  Future<void> _addDepartmentToFirebase(Department department) async {
    try {
      await FirebaseFirestore.instance.collection('departments').add({
        'title': department.title,
        'about': department.about,
      });
    } catch (error) {
      print("Failed to add department to Firebase: $error");
    }
  }
}
