import 'package:simple_dart_table/simple_dart_table.dart';

import 'table_column_to_header_cell_multilang.dart';
import 'table_value_to_cell_multilang.dart';
import 'table_value_to_string_multilang.dart';

class MultilangTable extends Table {
  MultilangTable() : super() {
    columnToHeaderCell = tableColumnToHeaderCellMultilang;
    valueToCell = tableValueToCellMultilang;
    valueToString = tableValueToStringMultilang;
  }
}
