import 'package:flutter/material.dart';
import 'package:vchd4webguide/pages/AddDepartment.dart';
import 'package:vchd4webguide/pages/AddPosition.dart';
import 'package:vchd4webguide/pages/AddUser.dart';
import 'package:vchd4webguide/pages/Edit.dart';

class AdminPage extends StatefulWidget {
  static final id = "admin page";
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ADMIN BO'LIMI"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddUser.id);
                },
                child: Text("Hodim qo'shish"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddDepartment.id);
                },
                child: Text("Bo'lim qo'shish"),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddPosition.id);
                },
                child: Text("Lavozim qo'shish"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, EditPage.id);
                },
                child: Text("Tahrirlash"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
