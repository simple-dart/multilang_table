import 'package:simple_dart_table/simple_dart_table.dart';

import 'multilang_column_header_cell.dart';

AbstractTableCell tableColumnToHeaderCellMultilang(TableColumnDescr columnDescr) =>
    MultilangColumnHeaderCell(columnDescr);
