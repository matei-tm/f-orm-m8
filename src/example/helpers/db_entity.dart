abstract class DbEntity {
  int get id;
}

abstract class DbAccountEntity implements DbEntity {
  String get accountName;
  String get accountEmail;
  String get accountAbbr;
}

abstract class DbAccountRelatedEntity implements DbEntity {
  int get accountId;
}