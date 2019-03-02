library flutter_orm_m8;

/// ColumnMetadata describes the basic options for
/// a column definition
class ColumnMetadata {
  /// Used to ignore mapping
  static const Ignore = 1;

  /// Used to mark the PrimaryKey
  static const PrimaryKey = 2;

  /// Add unique constraint
  static const Unique = 4;

  /// Add not null constraint
  static const NotNull = 8;

  /// Map as auto increment
  static const AutoIncrement = 16;

  /// Add index
  static const Indexed = 32;
}

/// DataTable describe the
/// generated table
class DataTable {
  /// The name of the table
  final String name;

  /// Constructor to define the annotation parameters
  const DataTable([this.name]);
}

const DataTable table = const DataTable();

/// DataColumn describe the
/// generated column
class DataColumn {
  /// The name of the column
  final String name;

  /// A bit mask formed by a combination of ColumnMetadata
  final int metadataLevel;

  /// Constructor to define the annotation parameters
  const DataColumn([this.name, this.metadataLevel]);
}

const DataColumn column = const DataColumn();
