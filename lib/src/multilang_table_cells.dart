import 'package:simple_dart_multilang_label/simple_dart_multilang_label.dart';
import 'package:simple_dart_multilang_link/simple_dart_multilang_link.dart';
import 'package:simple_dart_table/simple_dart_table.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class MultilangLabelTableCell extends MultilangLabel implements AbstractTableCell<String> {
  MultilangLabelTableCell() {
    addCssClass('TableCell');
    shrinkable = true;
    breakWords = true;
    shrinkable = true;
  }

  @override
  String get value => langKey;

  @override
  set value(String value) {
    langKey = value;
  }
}

class MultilangLinkTableCell extends MultilangLink implements AbstractTableCell<TableLink> {
  MultilangLinkTableCell() {
    addCssClass('TableCell');
    shrinkable = true;
    breakWords = true;
    shrinkable = true;
  }

  @override
  TableLink get value => TableLink(langKey, href);

  @override
  set value(TableLink value) {
    langKey = value.caption;
    href = value.url;
  }
}

class MultilangMultilineTableCell extends PanelComponent implements AbstractTableCell<List<dynamic>> {
  List<dynamic> _value = [];

  MultilangMultilineTableCell() : super('MultilineTableCell') {
    addCssClass('TableCell');
    vertical = true;
    shrinkable = true;
  }

  @override
  set value(List<dynamic> value) {
    _value = value;
    clear();
    addAll(value.map((e) => MultilangLabel()..langKey = e.toString()).toList());
  }

  @override
  List<dynamic> get value => _value;
}
