/// ColumnMetadata describes the basic options for
/// a column definition
class ColumnMetadata {
  /// Used to ignore mapping
  static const int ignore = 1;

  /// Used to mark the PrimaryKey
  static const int primaryKey = 2;

  /// Add unique constraint
  static const int unique = 4;

  /// Add not null constraint
  static const int notNull = 8;

  /// Map as auto increment
  static const int autoIncrement = 16;

  /// Add index
  static const int indexed = 32;
}
