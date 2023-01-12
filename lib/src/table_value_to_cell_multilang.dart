import 'package:simple_dart_table/simple_dart_table.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';
import 'package:simple_dart_utils_date_time/simple_dart_utils_date_time.dart' as utils_date_time;

import 'multilang_table_cells.dart';

AbstractTableCell tableValueToCellMultilang(TableColumnDescr columnDescr, dynamic value) {
  AbstractTableCell cell;
  if (value is TableLink) {
    cell = MultilangLinkTableCell(value);
  } else if (value is TableImage) {
    cell = ImageTableCell(value);
  } else if (value is Component) {
    cell = ComponentTableCell(value);
  } else if (value is List<String>) {
    cell = MultilangMultilineTableCell(value);
  } else if (value is List) {
    cell = MultiComponentTableCell(value);
  } else {
    var valueStr = '';
    if (value == null) {
      valueStr = '';
    } else if (value is num) {
      valueStr = value.toStringAsFixed(columnDescr.precision);
    } else if (value is DateTime) {
      valueStr = utils_date_time.formatDateTimeHumIfExist(value);
    } else {
      valueStr = value.toString();
    }
    cell = MultilangLabelTableCell(valueStr);
  }
  return cell;
}
