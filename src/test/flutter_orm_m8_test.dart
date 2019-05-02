import 'package:test/test.dart';
import 'package:f_orm_m8/f_orm_m8.dart';

import 'base_implementations/accountrelated/a01_entity.dart';
import 'base_implementations/independent/i01_entity.dart';
import 'base_implementations/open/o01_entity.dart';
import 'base_implementations/user_account.dart';

void main() {
  test('column metadata alteration', () {
    expect(ColumnMetadata.ignore, 1);
    expect(ColumnMetadata.primaryKey, 2);
    expect(ColumnMetadata.unique, 4);
    expect(ColumnMetadata.notNull, 8);
    expect(ColumnMetadata.autoIncrement, 16);
    expect(ColumnMetadata.indexed, 32);
    expect(
        ColumnMetadata.primaryKey |
            ColumnMetadata.unique |
            ColumnMetadata.autoIncrement,
        22);
  });

  test('column composite constraints alteration', () {
    var a = DataColumn("composite", compositeConstraints: [
      CompositeConstraint(
          name: "uq_account_entry",
          constraintType: CompositeConstraintType.unique)
    ]);
    expect(a.name, "composite");
    expect(a.compositeConstraints.length, 1);
    expect(a.compositeConstraints.first.name, "uq_account_entry");
    expect(a.compositeConstraints.first.constraintType,
        CompositeConstraintType.unique);
  });

  test('table metadata alteration', () {
    expect(TableMetadata.softDeletable, 1);
    expect(TableMetadata.trackCreate, 2);
    expect(TableMetadata.trackUpdate, 4);
  });

  group('base classes definitions', () {
    test('open entity', () {
      O01Entity dbEntity = O01Entity();
      dbEntity.idPart1 = 1;
      dbEntity.idPart2 = "_composite";
      expect(dbEntity.getPrimaryKey(), "0000000001:_composite");
    });

    test('simple entity', () {
      DbEntity dbEntity = I01Entity(1552003055, "New entry");
      dbEntity.id = 1;
      expect(dbEntity.id, 1);
    });
    test('account', () {
      DbAccountEntity dbEntity =
          UserAccount('John Doe', 'john.ross@the.dev', 'JR', true);
      dbEntity.id = 1;
      expect(dbEntity.id, 1);
      expect(dbEntity.userName, 'John Doe');
      expect(dbEntity.email, 'john.ross@the.dev');
      expect(dbEntity.abbreviation, 'JR');
      expect(dbEntity.isCurrent, true);
    });
    test('account related', () {
      DbAccountRelatedEntity dbEntity = A01Entity(1552003055, 2, "Other entry");
      dbEntity.id = 1;
      expect(dbEntity.id, 1);
      expect(dbEntity.accountId, 2);
    });
  });
}
