import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("profile_contacts")
class UserAccount implements DbAccountEntity {
  @DataColumn(
      "id",
      ColumnMetadata.PrimaryKey |
          ColumnMetadata.Unique |
          ColumnMetadata.AutoIncrement)
  int id;

  @DataColumn("account_name", ColumnMetadata.NotNull)
  String userName;

  @DataColumn("account_email", ColumnMetadata.NotNull)
  String email;

  @DataColumn("account_abbr", ColumnMetadata.NotNull)
  String abbreviation;

  UserAccount(this.userName, this.email, this.abbreviation);
}
