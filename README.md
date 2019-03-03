# flutter_orm_m8

![GitHub release](https://img.shields.io/github/release-pre/matei-tm/flutter-orm-m8.svg) [![pub package](https://img.shields.io/pub/v/flutter_orm_m8.svg)](https://pub.dartlang.org/packages/flutter_orm_m8) [![Build Status](https://travis-ci.org/matei-tm/flutter-orm-m8.svg?branch=master)](https://travis-ci.org/matei-tm/flutter-orm-m8)

Flutter package for ORM annotations.

## Introduction

The package adds definitions for a set of types that could be combined to expand ORM capabilities in the annotated code.
The current version, defines three types:

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

The options may be combined in various ways using | operator

```dart
@DataColumn("id", ColumnMetadata.PrimaryKey | ColumnMetadata.Unique | ColumnMetadata.AutoIncrement)
```

### DataTable

DataTable describes the required name for the table

```dart
@DataTable("a01_tests")
class A01Test implements DbAccountRelatedEntity {
```

### DataColumn

DataColumn describes the required name for the column in conjunction  with a bit mask for required ColumnMetadata's

```dart
  @DataColumn("id", ColumnMetadata.PrimaryKey | ColumnMetadata.Unique | ColumnMetadata.AutoIncrement)
  int _id;
```

## Usage

```dart
@DataTable("a01_tests")
class A01Test implements DbAccountRelatedEntity {
  @DataColumn("id", ColumnMetadata.PrimaryKey | ColumnMetadata.Unique | ColumnMetadata.AutoIncrement)
  int _id;

  @DataColumn("account_id")
  int _accountId;

  @DataColumn("record_date")
  int _recordDate;

  @DataColumn("is_deleted")
  int _isDeleted;
}
```

