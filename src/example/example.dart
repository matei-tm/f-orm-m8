import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("health_issues")
class HealthIssue implements DbAccountRelatedEntity {
  @DataColumn(
      "id",
      ColumnMetadata.PrimaryKey |
          ColumnMetadata.Unique |
          ColumnMetadata.AutoIncrement)
  int _id;

  @DataColumn("account_id")
  int _accountId;

  @DataColumn("record_date")
  int _recordDate;

  @DataColumn("is_deleted")
  int _isDeleted;

  @DataColumn("description")
  String _description;

  int get id => _id;
  int get accountId => _accountId;
  int get recordDate => _recordDate;
  int get isDeleted => _isDeleted;
  String get description => _description;

  HealthIssue(this._recordDate, this._accountId, this._description);
  HealthIssue.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._accountId = map['account_id'];
    this._recordDate = map['record_date'];
    this._isDeleted = map['is_deleted'];

    this._description = map['description'];
  }
  @override
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['account_id'] = _accountId;
    map['record_date'] = _recordDate;
    map['is_deleted'] = _isDeleted;

    return map;
  }

  @override
  HealthIssue getDbEntityFromMap(Map<String, dynamic> map) {
    return HealthIssue.fromMap(map);
  }
  /* ... */
}
