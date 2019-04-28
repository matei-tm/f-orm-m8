import 'package:flutter_orm_m8/annotation/composite_constraint.dart';
import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable(
    "health_issues",
    TableMetadata.softDeletable |
        TableMetadata.trackCreate |
        TableMetadata.trackUpdate)
class HealthIssue implements DbAccountRelatedEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.primaryKey |
          ColumnMetadata.unique |
          ColumnMetadata.autoIncrement)
  int id;

  @DataColumn("account_id", compositeConstraints: [
    CompositeConstraint(
        name: "uq_account_entry",
        constraintType: CompositeConstraintType.unique)
  ])
  int accountId;

  @DataColumn("description", compositeConstraints: [
    CompositeConstraint(
        name: "uq_account_entry",
        constraintType: CompositeConstraintType.unique)
  ])
  String description;

  @DataColumn("record_date", compositeConstraints: [
    CompositeConstraint(
        name: "ix_record_date", constraintType: CompositeConstraintType.indexed)
  ])
  int recordDate;

  HealthIssue(this.accountId, this.description);
}
