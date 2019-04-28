import 'package:flutter_orm_m8/annotation/composite_constraint.dart';
import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("i02_entities")
class I02Entity implements DbEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.PrimaryKey |
          ColumnMetadata.Unique |
          ColumnMetadata.AutoIncrement)
  int id;

  @DataColumn("record_date", compositeConstraints: [
    CompositeConstraint(
        name: "ix_record_date", constraintType: CompositeConstraintType.indexed)
  ])
  int recordDate;

  @DataColumn("is_deleted")
  int isDeleted;

  @DataColumn("entry_name", compositeConstraints: [
    CompositeConstraint(
        name: "uq_entry_name", constraintType: CompositeConstraintType.unique)
  ])
  String entryName;
}
