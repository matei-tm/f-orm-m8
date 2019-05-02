import 'package:f_orm_m8/f_orm_m8.dart';

@DataTable("profile_contacts")
class UserAccount implements DbAccountEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.primaryKey |
          ColumnMetadata.unique |
          ColumnMetadata.autoIncrement)
  int id;

  @DataColumn("account_name", metadataLevel: ColumnMetadata.notNull)
  String userName;

  @DataColumn("account_email", metadataLevel: ColumnMetadata.notNull)
  String email;

  @DataColumn("account_abbr", metadataLevel: ColumnMetadata.notNull)
  String abbreviation;

  @DataColumn("is_current", metadataLevel: ColumnMetadata.notNull)
  bool isCurrent;

  UserAccount(this.userName, this.email, this.abbreviation, this.isCurrent);
}
