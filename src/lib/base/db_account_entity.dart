import 'package:flutter_orm_m8/base/db_entity.dart';

/// Base class for a generic Account
abstract class DbAccountEntity implements DbEntity {
  /// The user name (or login name)
  String userName;

  /// The email
  String email;

  /// A two letter abbreviation
  String abbreviation;

  /// A boolean that signals the current account
  bool isCurrent;
}
