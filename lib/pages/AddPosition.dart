import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vchd4webguide/models/position.dart';

class AddPosition extends StatefulWidget {
  static const id = "add position";
  const AddPosition({super.key});

  @override
  State<AddPosition> createState() => _AddPositionState();
}

class _AddPositionState extends State<AddPosition> {
  final TextEditingController _titleController = TextEditingController();


  void _addPosition() {
    if (_titleController.text.isNotEmpty) {
      final newPosition = Position(
        id: DateTime.now().toString(),
        title: _titleController.text,
      );
      Provider.of<Positions>(context, listen: false).addPosition(newPosition);

      // Clear the text fields
      _titleController.clear();

      // Optionally, show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Position added successfully!')),
      );

      // Update the UI by calling setState
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final positionList = Provider.of<Positions>(context).list;

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
                labelText: 'Position Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
           
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addPosition,
              child: Text('Add Position'),
            ),
            SizedBox(height: 20),
            Text("Lavozimlar Ro'yxati"),
            Expanded(
              child: ListView.builder(
                itemCount: positionList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(positionList[index].title),
                  
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
