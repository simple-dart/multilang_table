import 'package:simple_dart_table/simple_dart_table.dart';

import '../simple_dart_multilang_table.dart';

class MultilangTable extends Table {
  MultilangTable() : super();

  @override
  void initColumns(List<TableColumnDescr> columns) {
    this.columns = columns;
    headersRow = MultilangTableRow(columns)
      ..addCssClass('Header')
      ..rowData = columns;
    for (var i = 0; i < columns.length; i++) {
      final columnDescr = columns[i];
      final headerCell = headersRow.cells[i];
      if (columnDescr.sortable) {
        headerCell.element.onClick.listen((e) {
          var desc = false;
          if (headerCell.hasCssClass('Sorted')) {
            headerCell
              ..removeCssClass('Sorted')
              ..addCssClass('SortedDesc');
            desc = true;
          } else if (headerCell.hasCssClass('SortedDesc')) {
            headerCell.removeCssClass('SortedDesc');
          } else {
            headerCell.addCssClass('Sorted');
          }
          for (final otherHeaderCell in headersRow.cells) {
            if (otherHeaderCell == headerCell) {
              continue;
            } else {
              otherHeaderCell
                ..removeCssClass('Sorted')
                ..removeCssClass('SortedDesc');
            }
          }
          sortData(columnIndex: i, desc: desc);
        });
      }
    }
    addAll([headersRow, scrollablePanel]);
  }

  @override
  AbstractTableRow createRow(List rowData) {
    final row = MultilangTableRow(columns)..rowData = rowData;
    formatRow(row);
    rows.add(row);
    scrollablePanel.add(row);
    return row;
  }
}
