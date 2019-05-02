import 'package:f_orm_m8/f_orm_m8.dart';

@DataTable("a01_entities")
class A01Entity implements DbAccountRelatedEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.primaryKey |
          ColumnMetadata.unique |
          ColumnMetadata.autoIncrement)
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
