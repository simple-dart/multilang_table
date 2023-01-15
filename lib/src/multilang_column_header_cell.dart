import 'package:simple_dart_multilang_label/simple_dart_multilang_label.dart';
import 'package:simple_dart_table/simple_dart_table.dart';

class MultilangColumnHeaderCell extends MultilangLabel implements AbstractTableCell<TableColumnDescr> {
  late TableColumnDescr _columnDescr;

  MultilangColumnHeaderCell(TableColumnDescr columnDescr) : super() {
    addCssClass('TableCell');
    shrinkable = true;
    value = columnDescr;
  }

  @override
  set value(TableColumnDescr value) {
    _columnDescr = value;
    langKey = value.caption;
    width = '${value.width}px';
    if (value.sortable) {
      addCssClass('Sortable');
    }
    hAlign = value.hAlign;
  }

  @override
  TableColumnDescr get value => _columnDescr;
}
