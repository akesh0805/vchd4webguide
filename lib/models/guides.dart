import 'package:flutter/material.dart';

class Guide with ChangeNotifier {
  final String id;
  final String title;
  final String about;
  Guide({required this.id, required this.title, required this.about});
}

class Guides with ChangeNotifier {
  final List<Guide> _list = [
    Guide(id: 'g1', title: "Kirish Yo'riqnomasi", about: ""),
    Guide(id: 'g2', title: "Birlamchi Yo'riqnoma", about: ""),
    Guide(id: 'g3', title: "Joriy Yo'riqnoma", about: ""),
    Guide(id: 'g4', title: "Davriy Yo'riqnoma", about: ""),
    Guide(id: 'g5', title: "Navbatdan tashqari Yo'riqnoma", about: ""),
  ];

  List<Guide> get list {
    return [..._list];
  }

  void addGuide(Guide newGuide) {
    _list.add(newGuide);
    notifyListeners();
  }
}
