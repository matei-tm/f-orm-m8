import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("a01_entities")
class A01Entity implements DbAccountRelatedEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.PrimaryKey |
          ColumnMetadata.Unique |
          ColumnMetadata.AutoIncrement)
  int id;

  @DataColumn("account_id")
  int accountId;

  @DataColumn("record_date")
  int recordDate;

  @DataColumn("is_deleted")
  int isDeleted;

  String entryName;

  A01Entity(this.recordDate, this.accountId, this.entryName);

  A01Entity.empty() {
    entryName = "";
  }
}
