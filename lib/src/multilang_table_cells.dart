import 'package:simple_dart_multilang_label/simple_dart_multilang_label.dart';
import 'package:simple_dart_multilang_link/simple_dart_multilang_link.dart';
import 'package:simple_dart_table/simple_dart_table.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class MultilangLabelTableCell extends MultilangLabel implements AbstractTableCell {
  MultilangLabelTableCell(String langKey) {
    addCssClass('TableCell');
    this.langKey = langKey;
    shrinkable = true;
    breakWords = true;
    shrinkable = true;
  }

  @override
  String get text => caption;
}

class MultilangLinkTableCell extends MultilangLink implements AbstractTableCell {
  MultilangLinkTableCell(TableLink content) {
    addCssClass('TableCell');
    langKey = content.caption;
    href = content.url;
    shrinkable = true;
    breakWords = true;
    shrinkable = true;
  }

  @override
  String get text => caption;
}

class MultilangMultilineTableCell extends PanelComponent implements AbstractTableCell {
  MultilangMultilineTableCell(List<dynamic> content) : super('MultilineTableCell') {
    addCssClass('TableCell');
    vertical = true;
    shrinkable = true;
    addAll(content.map((e) => MultilangLabel()..langKey = e.toString()).toList());
  }

  @override
  String get text => children.map((e) => (e as MultilangLabel).caption).join('/n');
}
