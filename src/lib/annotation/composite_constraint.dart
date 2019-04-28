import 'package:meta/meta.dart';

/// Enumerate the constraints that are candidates to composition
enum CompositeConstraintType { unique, primaryKey, foreignKey, indexed }

/// CompositeConstraint describe the constraints that require
/// non default naming or aggregation with another constraint with same name and type
class CompositeConstraint {
  // The name of the constraint
  final String name;

  // The constraint type
  final CompositeConstraintType constraintType;

  // The constructor with named, required parameters
  const CompositeConstraint(
      {@required this.name, @required this.constraintType})
      : assert(name != null),
        assert(constraintType != null);
}
