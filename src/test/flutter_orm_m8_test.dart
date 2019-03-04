import 'package:test/test.dart';
import 'package:flutter_orm_m8/flutter_orm_m8.dart';

void main() {
  test('column metadata alteration', () {
    expect(ColumnMetadata.Ignore, 1);
    expect(ColumnMetadata.PrimaryKey, 2);
    expect(ColumnMetadata.Unique, 4);
    expect(ColumnMetadata.NotNull, 8);
    expect(ColumnMetadata.AutoIncrement, 16);
    expect(ColumnMetadata.Indexed, 32);
    expect(
        ColumnMetadata.PrimaryKey |
            ColumnMetadata.Unique |
            ColumnMetadata.AutoIncrement,
        22);
  });
}
