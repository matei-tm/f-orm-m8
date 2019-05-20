import 'package:test/test.dart';
import 'package:f_orm_m8/f_orm_m8.dart';

import 'base_implementations/accountrelated/a02_entity.dart';

void main() {
  group('DataColumn tests', () {
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
  });

  group('DataColumn composite constraints', () {
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
    test('test null on name', () {
      expect(
          () => CompositeConstraint(
              name: null, constraintType: CompositeConstraintType.indexed),
          throwsA(TypeMatcher<AssertionError>()));
    });

    test('test null on constraintType', () {
      expect(() => CompositeConstraint(name: "ix_01", constraintType: null),
          throwsA(TypeMatcher<AssertionError>()));
    });

    test('test composite annotation', () {
      DbAccountRelatedEntity dbEntity = A02Entity();
      dbEntity.id = 1;
      dbEntity.accountId = 2;

      expect(dbEntity.id, 1);
      expect(dbEntity.accountId, 2);
    });
  });
}
