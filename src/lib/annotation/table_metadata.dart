/// TableMetadata describes the basic options for
/// a table definition
class TableMetadata {
  /// Used to enable soft delete
  static const softDeletable = 1;

  /// Used to include column date_created
  static const trackCreate = 2;

  /// Used to include column date_updated
  static const trackUpdate = 4;
}
