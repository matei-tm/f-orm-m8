import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("profile_contacts")
class UserAccount implements DbAccountEntity {
  @DataColumn(
      "id",
      ColumnMetadata.PrimaryKey |
          ColumnMetadata.Unique |
          ColumnMetadata.AutoIncrement)
  int _id;

  @DataColumn("account_name", ColumnMetadata.NotNull)
  String _userName;

  @DataColumn("account_email", ColumnMetadata.NotNull)
  String _email;

  @DataColumn("account_abbr", ColumnMetadata.NotNull)
  String _abbreviation;

  UserAccount(this._userName, this._email, this._abbreviation);

  @override
  UserAccount.empty() {
    _userName = "";
    _email = "";
    _abbreviation = "";
  }

  @override
  UserAccount.map(dynamic obj) {
    this._id = obj['id'];
    this._userName = obj['account_name'];
    this._email = obj['account_email'];
    this._abbreviation = obj['account_abbr'];
  }

  @override
  UserAccount.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._userName = map['account_name'];
    this._email = map['account_email'];
    this._abbreviation = map['account_abbr'];
  }

  @override
  int get id => _id;

  String get userName => _userName;
  String get email => _email;
  String get abbreviation => _abbreviation;

  @override
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['account_name'] = _userName;
    map['account_email'] = _email;
    map['account_abbr'] = _abbreviation;

    return map;
  }

  @override
  UserAccount getDbEntityFromMap(Map<String, dynamic> map) {
    return UserAccount.fromMap(map);
  }
}
