import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("o01_entities")
class O01Entity implements DbOpenEntity {
  @DataColumn("id_part1", metadataLevel: ColumnMetadata.PrimaryKey)
  int idPart1;

  @DataColumn("id_part2", metadataLevel: ColumnMetadata.PrimaryKey)
  String idPart2;

  @DataColumn("record_date")
  int recordDate;

  @DataColumn("is_deleted")
  int isDeleted;

  String entryName;

  @override
  getPrimaryKey() {
    return "${idPart1.toString().padLeft(10, '0')}:$idPart2";
  }
}
