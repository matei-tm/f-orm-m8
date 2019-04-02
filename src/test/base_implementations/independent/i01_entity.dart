import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("i01_entities")
class I01Entity implements DbEntity {
  @DataColumn(
      "id",
      ColumnMetadata.PrimaryKey |
          ColumnMetadata.Unique |
          ColumnMetadata.AutoIncrement)
  int id;

  @DataColumn("record_date")
  int recordDate;

  @DataColumn("is_deleted")
  int isDeleted;

  String entryName;

  I01Entity(this.recordDate, this.entryName);

  I01Entity.empty() {
    /*_entryName = "";*/
  }
}
