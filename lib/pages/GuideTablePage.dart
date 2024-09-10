import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:intl/intl.dart';
import 'package:vchd4webguide/models/users.dart';

class GuideTablePage extends StatelessWidget {
  static const id = "table page";

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: formattedDate,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: " yil kungi JORIY YO'RIQNOMA",
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<Users>(context, listen: false).fetchAndSetUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final users = Provider.of<Users>(context).list;
            final userDataSource = UserDataSource(users);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                child: SfDataGrid(
                  source: userDataSource,
                  columns: [
                    GridColumn(
                      columnName: 'id',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('SANA',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      width: 100, // Adjust width as needed
                    ),
                    GridColumn(
                      columnName: 'fio',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('F.I.O'),
                      ),
                      width: 150, // Adjust width as needed
                    ),
                    GridColumn(
                      columnName: 'position',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('LAVOZIM'),
                      ),
                      width: 150, // Adjust width as needed
                    ),
                    GridColumn(
                      columnName: 'department',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('ISH JOY'),
                      ),
                      width: 150, // Adjust width as needed
                    ),
                    GridColumn(
                      columnName: 'fingerprint',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Text('IMZO'),
                      ),
                      width: 150, // Adjust width as needed
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class UserDataSource extends DataGridSource {
  UserDataSource(this.users) {
    _buildDataGridRows();
  }

  final List<User> users;
  List<DataGridRow> _dataGridRows = [];

  void _buildDataGridRows() {
    _dataGridRows = users.map<DataGridRow>((user) {
      
    String data = DateFormat('dd MMMM yyyy').format(DateTime.now());
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: data),
        DataGridCell<String>(columnName: 'fio', value: user.fio),
        DataGridCell<String>(columnName: 'position', value: user.position),
        DataGridCell<String>(columnName: 'department', value: user.department),
        DataGridCell<String>(
            columnName: 'fingerprint', value: user.fingerprint),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: [
        Container(
          alignment: Alignment.center,
          child: Text(row.getCells()[0].value.toString()),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(row.getCells()[1].value.toString()),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(row.getCells()[2].value.toString()),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(row.getCells()[3].value.toString()),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(row.getCells()[4].value.toString()),
        ),
      ],
    );
  }
}
