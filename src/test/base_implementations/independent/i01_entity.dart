import 'package:f_orm_m8/f_orm_m8.dart';

@DataTable("i01_entities")
class I01Entity implements DbEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.primaryKey |
          ColumnMetadata.unique |
          ColumnMetadata.autoIncrement)
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
