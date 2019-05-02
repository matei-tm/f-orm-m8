import 'package:f_orm_m8/f_orm_m8.dart';

@DataTable("i02_entities")
class I02Entity implements DbEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.primaryKey |
          ColumnMetadata.unique |
          ColumnMetadata.autoIncrement)
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
