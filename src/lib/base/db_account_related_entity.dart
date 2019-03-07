import 'package:flutter_orm_m8/base/db_entity.dart';

/// Base class for entities related to account
/// i.e. user dependent
abstract class DbAccountRelatedEntity implements DbEntity {
  /// the related account id
  int get accountId;
}
