/// Base class for any entity that will be scaffolded
abstract class DbEntity {
  /// The id of the entity
  int get id;

  /// Converter of the instance to a Map
  Map<String, dynamic> toMap();
}
