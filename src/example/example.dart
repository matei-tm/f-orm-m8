import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable(
    "health_issues",
    TableMetadata.SoftDeletable |
        TableMetadata.TrackCreate |
        TableMetadata.TrackUpdate)
class HealthIssue implements DbAccountRelatedEntity {
  @DataColumn(
      "id",
      ColumnMetadata.PrimaryKey |
          ColumnMetadata.Unique |
          ColumnMetadata.AutoIncrement)
  int id;

  @DataColumn("account_id")
  int accountId;

  @DataColumn("description")
  String description;

  HealthIssue(this.accountId, this.description);
}
