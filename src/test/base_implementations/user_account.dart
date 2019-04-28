import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("profile_contacts")
class UserAccount implements DbAccountEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.PrimaryKey |
          ColumnMetadata.Unique |
          ColumnMetadata.AutoIncrement)
  int id;

  @DataColumn("account_name", metadataLevel: ColumnMetadata.NotNull)
  String userName;

  @DataColumn("account_email", metadataLevel: ColumnMetadata.NotNull)
  String email;

  @DataColumn("account_abbr", metadataLevel: ColumnMetadata.NotNull)
  String abbreviation;

  @DataColumn("is_current", metadataLevel: ColumnMetadata.NotNull)
  bool isCurrent;

  UserAccount(this.userName, this.email, this.abbreviation, this.isCurrent);
}
