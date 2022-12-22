import 'package:simple_dart_multilang_label/simple_dart_multilang_label.dart';
import 'package:simple_dart_table/simple_dart_table.dart';

class MultilangColumnHeaderCell extends MultilangLabel implements AbstractTableCell {
  MultilangColumnHeaderCell(TableColumnDescr column) {
    addCssClass('TableCell');
    langKey = column.caption;
    width = '${column.width}px';
    if (column.sortable) {
      addCssClass('Sortable');
    }
    hAlign = column.hAlign;
    shrinkable = true;
  }

  @override
  String get text => caption;
}
