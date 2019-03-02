abstract class DbEntity {
  int get id;
}

abstract class DbAccountRelatedEntity implements DbEntity {
  int get accountId;
}