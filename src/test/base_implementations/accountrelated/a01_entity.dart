import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("a01_entities")
class A01Entity implements DbAccountRelatedEntity {
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

  String _entryName;

  A01Entity(this._recordDate, this._accountId, this._entryName);

  A01Entity.empty() {
    _entryName = "";
  }

  void setId(int newId) {
    _id = newId;
  }

  A01Entity.map(dynamic obj) {
    this._id = obj['id'];
    this._accountId = obj['account_id'];
    this._recordDate = obj['record_date'];
    this._isDeleted = obj['is_deleted'];

    this._entryName = obj['entry_name'];
  }

  A01Entity.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._accountId = map['account_id'];
    this._recordDate = map['record_date'];
    this._isDeleted = map['is_deleted'];

    this._entryName = map['entry_name'];
  }

  int get id => _id;
  int get accountId => _accountId;
  int get recordDate => _recordDate;
  int get isDeleted => _isDeleted;

  String get entryName => _entryName;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['account_id'] = _accountId;
    map['record_date'] = _recordDate;
    map['is_deleted'] = _isDeleted;

    map['entry_name'] = _entryName;
    return map;
  }

  @override
  A01Entity getDbEntityFromMap(Map<String, dynamic> map) {
    return A01Entity.fromMap(map);
  }
}
