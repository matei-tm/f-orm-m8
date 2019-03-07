import 'package:flutter_orm_m8/base/db_entity.dart';

/// Base class for a generic Account
abstract class DbAccountEntity implements DbEntity {
  /// The user name (or login name)
  String get userName;

  /// The email
  String get email;

  /// A two letter abbreviation
  String get abbreviation;
}
