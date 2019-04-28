import 'package:flutter_orm_m8/annotation/composite_constraint.dart';
import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("a01_entities")
class A02Entity implements DbAccountRelatedEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.PrimaryKey |
          ColumnMetadata.Unique |
          ColumnMetadata.AutoIncrement)
  int id;

  @DataColumn("account_id", compositeConstraints: [
    CompositeConstraint(
        name: "uq_account_entry",
        constraintType: CompositeConstraintType.unique)
  ])
  int accountId;

  @DataColumn("entry_name", compositeConstraints: [
    CompositeConstraint(
        name: "uq_account_entry",
        constraintType: CompositeConstraintType.unique)
  ])
  String entryName;

  @DataColumn("record_date")
  int recordDate;

  @DataColumn("is_deleted")
  int isDeleted;
}
