
import 'dart:io';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

void main() async {
  var file = 'e:/Dinuk/Investment-Tracker/Inv.xlsx';
  try {
    var bytes = File(file).readAsBytesSync();
    var decoder = SpreadsheetDecoder.decodeBytes(bytes);

    for (var table in decoder.tables.keys) {
      print('=== Sheet: $table ===');
      var sheet = decoder.tables[table];
      if (sheet != null) {
        var maxRows = sheet.rows.length > 20 ? 20 : sheet.rows.length;
        for (var i = 0; i < maxRows; i++) {
          var row = sheet.rows[i];
          // Filter out nulls for cleaner print, or print as string
          var rowStr = row.map((e) => e?.toString() ?? '-').join(' | ');
          print('Row $i: $rowStr');
        }
      }
      print('================');
    }
  } catch (e) {
    print("Error reading excel: $e");
  }
}
