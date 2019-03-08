import 'package:flutter_orm_m8/flutter_orm_m8.dart';

@DataTable("i01_entities")
class I01Entity implements DbEntity {
  @DataColumn(
      "id",
      ColumnMetadata.PrimaryKey &
          ColumnMetadata.Unique &
          ColumnMetadata.AutoIncrement)
  int _id;

  @DataColumn("record_date")
  int _recordDate;

  @DataColumn("is_deleted")
  int _isDeleted;

  String _entryName;

  I01Entity(this._recordDate, this._entryName);

  I01Entity.empty() {
    /*_entryName = "";*/
  }

  void setId(int newId) {
    _id = newId;
  }

  I01Entity.map(dynamic obj) {
    this._id = obj['id'];
    this._recordDate = obj['record_date'];
    this._isDeleted = obj['is_deleted'];

    this._entryName = obj['entry_name'];
  }

  I01Entity.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._recordDate = map['record_date'];
    this._isDeleted = map['isDeleted'];

    this._entryName = map['entry_name'];
  }

  int get id => _id;
  int get recordDate => _recordDate;
  int get isDeleted => _isDeleted;

  String get entryName => _entryName;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['record_date'] = _recordDate;
    map['is_deleted'] = _isDeleted;

    map['entry_name'] = _entryName;
    return map;
  }
}
