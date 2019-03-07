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
