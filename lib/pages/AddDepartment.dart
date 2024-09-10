import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vchd4webguide/models/departments.dart';

class AddDepartment extends StatefulWidget {
  static const String id = 'add_department';

  @override
  _AddDepartmentState createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  void _addDepartment() {
    if (_titleController.text.isNotEmpty) {
      final newDepartment = Department(
        id: DateTime.now().toString(),
        title: _titleController.text,
        about: _aboutController.text,
      );
      Provider.of<Departments>(context, listen: false).addDepartment(newDepartment);

      // Clear the text fields
      _titleController.clear();
      _aboutController.clear();

      // Optionally, show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Department added successfully!')),
      );

      // Update the UI by calling setState
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final departmentList = Provider.of<Departments>(context).list;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Department'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Department Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _aboutController,
              decoration: InputDecoration(
                labelText: 'Department About',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addDepartment,
              child: Text('Add Department'),
            ),
            SizedBox(height: 20),
            Text("Bo'limlar Ro'yxati"),
            Expanded(
              child: ListView.builder(
                itemCount: departmentList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(departmentList[index].title),
                    subtitle: Text(departmentList[index].about),
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
