import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:vchd4webguide/models/users.dart';
import 'package:flutter/material.dart';
class UserDataSource extends DataGridSource {
  UserDataSource(this.users) {
    _buildDataGridRows();
  }

  final List<User> users;
  List<DataGridRow> _dataGridRows = [];

  void _buildDataGridRows() {
    _dataGridRows = users.map<DataGridRow>((user) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: user.id),
        DataGridCell<String>(columnName: 'fio', value: user.fio),
        DataGridCell<String>(columnName: 'position', value: user.position),
        DataGridCell<String>(columnName: 'department', value: user.department),
        DataGridCell<String>(columnName: 'fingerprint', value: user.fingerprint),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}