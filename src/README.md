# flutter_orm_m8

Flutter package for ORM annotations.

## Introduction

The package add definitions for a set of types that could be combined to expand ORM capabilities from annotated code.
Current version, define three types:

- ColumnMetadata
- DataTable
- DataColumn

### ColumnMetadata

The ColumnMetadata describes the basic options for a column definition:

- Ignore
- PrimaryKey
- Unique
- NotNull
- AutoIncrement
- Indexed

### DataTable

DataTable describe the required name for the table

### DataColumn

DataColumn describe the required name for the column and a bit mask for required ColumnMetadata's

## Usage


```dart
@DataTable("a01_tests")
class A01Test implements DbAccountRelatedEntity {
  @DataColumn("id", ColumnMetadata.PrimaryKey & ColumnMetadata.Unique & ColumnMetadata.AutoIncrement)
  int _id;

  @DataColumn("account_id")
  int _accountId;

  @DataColumn("record_date")
  int _recordDate;

  @DataColumn("is_deleted")
  int _isDeleted;
}
```

