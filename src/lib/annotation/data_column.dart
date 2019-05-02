import 'package:f_orm_m8/annotation/composite_constraint.dart';

/// DataColumn describe the
/// generated column
class DataColumn {
  /// The name of the column
  final String name;

  /// A bit mask formed by a combination of ColumnMetadata
  final int metadataLevel;

  /// A list of composite constraints
  final List<CompositeConstraint> compositeConstraints;

  /// Constructor to define the annotation parameters
  const DataColumn(this.name, {this.metadataLevel, this.compositeConstraints});
}
