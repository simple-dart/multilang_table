import 'package:simple_dart_table/simple_dart_table.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

import '../simple_dart_multilang_table.dart';

class CellRendererMultilang extends CellRenderer {
  @override
  bool checkCellByType(AbstractTableCell cell, dynamic value) {
    if ((value == null || value is String) && cell is MultilangLabelTableCell) {
      return true;
    }
    if (value is TableColumnDescr && cell is MultilangColumnHeaderCell) {
      return true;
    }
    if (value is bool && cell is BooleanTableCell) {
      return true;
    }
    if (value is num && cell is NumTableCell) {
      return true;
    }
    if (value is DateTime && cell is DateTimeTableCell) {
      return true;
    }
    if (value is TableLink && cell is MultilangLinkTableCell) {
      return true;
    }
    if (value is TableImage && cell is ImageTableCell) {
      return true;
    }
    if (value is Component && cell is ComponentTableCell) {
      return true;
    }
    if (value is List<String> && cell is MultilangMultilineTableCell) {
      return true;
    }
    if (value is List<Component> && cell is MultiComponentTableCell) {
      return true;
    }
    return false;
  }

  @override
  AbstractTableCell createCellByType(TableColumnDescr columnDescr, dynamic value) {
    if (value == null || value is String) {
      return MultilangLabelTableCell();
    }
    if (value is TableColumnDescr) {
      return createColumnHeader(value);
    }
    if (value is bool) {
      return BooleanTableCell()..value = value;
    }
    if (value is num) {
      return NumTableCell()
        ..precision = columnDescr.precision ?? 0
        ..value = value;
    }
    if (value is DateTime) {
      return DateTimeTableCell()..value = value;
    }
    if (value is TableLink) {
      return MultilangLinkTableCell()..value = value;
    }
    if (value is TableImage) {
      return ImageTableCell(value);
    }
    if (value is Component) {
      return ComponentTableCell(value);
    }
    if (value is List<String>) {
      return MultilangMultilineTableCell()..value = value;
    }
    if (value is List<Component>) {
      return MultiComponentTableCell()..value = value;
    }
    throw Exception('Unsupported type of value: ${value.runtimeType}');
  }

  AbstractTableCell createColumnHeader(TableColumnDescr columnDescr) => MultilangColumnHeaderCell(columnDescr);
}
