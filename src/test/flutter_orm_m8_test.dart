import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_orm_m8/flutter_orm_m8.dart';

void main() {
  test('column metadata alteration', () {
    final columnMetadata = ColumnMetadata();
    expect(ColumnMetadata.Ignore, 0);
    expect(ColumnMetadata.PrimaryKey, 1);
    expect(ColumnMetadata.Unique, 2);
    expect(ColumnMetadata.NotNull, 4);
    expect(ColumnMetadata.AutoIncrement, 8);
    expect(ColumnMetadata.Indexed, 16);
    expect(ColumnMetadata.PrimaryKey | ColumnMetadata.Unique | ColumnMetadata.AutoIncrement, 11);
  });
}
