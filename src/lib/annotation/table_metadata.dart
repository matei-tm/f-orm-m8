/// TableMetadata describes the basic options for
/// a table definition
class TableMetadata {
  /// Used to enable soft delete
  static const SoftDeletable = 1;

  /// Used to include column date_created
  static const TrackCreate = 2;

  /// Used to include column date_updated
  static const TrackUpdate = 4;
}
