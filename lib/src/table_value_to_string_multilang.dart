import 'package:simple_dart_multilang_controller/simple_dart_multilang_controller.dart';
import 'package:simple_dart_table/simple_dart_table.dart';

String tableValueToStringMultilang(TableColumnDescr columnDescr, dynamic value) {
  String formattedValue;
  if (value is TableLink) {
    formattedValue = multilangController.translate(value.caption);
  } else if (value is TableImage) {
    formattedValue = value.url;
  } else if (value is List) {
    formattedValue = value.map((e) => multilangController.translate(e.toString())).join(';');
  } else if (value == null) {
    formattedValue = '';
  } else if (value is num) {
    formattedValue = value.toStringAsFixed(columnDescr.precision).replaceAll('.', ',');
  } else {
    formattedValue = multilangController.translate(value.toString());
  }
  return formattedValue;
}
