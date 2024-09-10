import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:vchd4webguide/models/users.dart';
import 'package:vchd4webguide/models/departments.dart';
import 'package:vchd4webguide/models/position.dart';

class AddUser extends StatefulWidget {
  static const String id = 'add_user';

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  void initState() {
    super.initState();
    Provider.of<Users>(context, listen: false).fetchAndSetUsers();
  }

  final TextEditingController _fioController = TextEditingController();
  String? _selectedPosition;
  String? _selectedDepartment;
  String _fingerprint = '';

  Future<void> _saveUserToFirebase(User newUser) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(newUser.toMap());
      print("User added to Firebase successfully.");
    } catch (error) {
      print("Failed to add user to Firebase: $error");
    }
  }

  void _addUser() {
    if (_fioController.text.isNotEmpty &&
        _selectedPosition != null &&
        _selectedDepartment != null) {
      final newUser = User(
        id: DateTime.now().toString(),
        fio: _fioController.text,
        position: _selectedPosition!,
        department: _selectedDepartment!,
        fingerprint: _fingerprint,
      );

      Provider.of<Users>(context, listen: false).addUser(newUser);
      _saveUserToFirebase(newUser);

      _fioController.clear();
      setState(() {
        _selectedPosition = null;
        _selectedDepartment = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User added successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final departments = Provider.of<Departments>(context).list;
    final positions = Provider.of<Positions>(context).list;
    final users = Provider.of<Users>(context).list;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fioController,
              decoration: InputDecoration(
                labelText: 'F.I.O',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedPosition,
              hint: Text('Select Position'),
              items: positions.map((position) {
                return DropdownMenuItem<String>(
                  value: position.title,
                  child: Text(position.title),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPosition = value;
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedDepartment,
              hint: Text('Select Department'),
              items: departments.map((department) {
                return DropdownMenuItem<String>(
                  value: department.title,
                  child: Text(department.title),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDepartment = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addUser,
              child: Text('Add User'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].fio),
                    subtitle: Text(
                        '${users[index].position} - ${users[index].department}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
