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
