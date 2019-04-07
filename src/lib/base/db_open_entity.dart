/// Base class for unconstrained entity that will be scaffolded
abstract class DbOpenEntity {
  /// Returns the user implementation of primary key (PK) members unicity combinantion
  /// If the implementation use only one field as PK candidate then the method will return that value
  /// If the implementation use many fields for a composite PK then
  /// you will be responsible to get a unique expression result
  dynamic getPrimaryKey();
}
