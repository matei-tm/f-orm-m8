library flutter_orm_m8;

class ColumnMetadata {
  static const Ignore = 0;
  static const PrimaryKey = 1;
  static const Unique = 2;
  static const NotNull = 4;
  static const AutoIncrement = 8;
  static const Indexed = 16;
}

class DataTable {
  final String name;

  const DataTable([this.name]);
}

const DataTable table = const DataTable();

class DataColumn {
  final String name;
  final int metadataLevel;

  const DataColumn([this.name, this.metadataLevel]);
}

const DataColumn column = const DataColumn();
