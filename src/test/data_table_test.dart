import 'package:test/test.dart';
import 'package:f_orm_m8/f_orm_m8.dart';

void main() {
  group('DataTable tests', () {
    test('table metadata alteration', () {
      expect(TableMetadata.softDeletable, 1);
      expect(TableMetadata.trackCreate, 2);
      expect(TableMetadata.trackUpdate, 4);
    });

    test('DataTable name', () {
      var a = DataTable("new_table");
      expect(a.name, "new_table");
    });

    test('DataTable metadataLevel', () {
      var a = DataTable("table_test",
          TableMetadata.softDeletable | TableMetadata.trackCreate);
      expect(a.metadataLevel, 3);
    });
  });
}
