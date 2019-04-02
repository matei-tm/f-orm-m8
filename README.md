# Flutter ORM Mate - flutter_orm_m8

![GitHub release](https://img.shields.io/github/release-pre/matei-tm/flutter-orm-m8.svg) [![pub package](https://img.shields.io/pub/v/flutter_orm_m8.svg)](https://pub.dartlang.org/packages/flutter_orm_m8) [![Build Status](https://travis-ci.org/matei-tm/flutter-orm-m8.svg?branch=master)](https://travis-ci.org/matei-tm/flutter-orm-m8)

Flutter package for ORM annotations.

- [Flutter ORM Mate - flutter_orm_m8](#flutter-orm-mate---flutterormm8)
  - [Introduction](#introduction)
    - [DataTable](#datatable)
    - [DataColumn](#datacolumn)
    - [TableMetadata](#tablemetadata)
    - [ColumnMetadata](#columnmetadata)
  - [Usage](#usage)

## Introduction

The package adds definitions for a set of types that could be combined to expand ORM capabilities in the annotated code.
The current version, defines three annotation types:

- ColumnMetadata
- DataTable
- DataColumn

In order to ease the code emitting three abstract classes are defined:

- DbEntity
- DbAccountEntity
- DbAccountRelatedEntity

### DataTable

DataTable describes the required name for the table in conjuction with a bit mask for optional TableMetadata

```dart
@DataTable("a01_tests")
class A01Test implements DbAccountRelatedEntity {
```

### DataColumn

DataColumn describes the required name for the column in conjunction  with a bit mask for required ColumnMetadata's

```dart
  @DataColumn("id", ColumnMetadata.PrimaryKey | ColumnMetadata.Unique | ColumnMetadata.AutoIncrement)
  int id;
```

### TableMetadata

The TableMetadata describes the basic options for the table:

- SoftDeletable
- TrackCreate
- TrackUpdate

The options may be combined in various ways using | operator

```dart
@DataTable(
    "health_issues",
        TableMetadata.SoftDeletable |
        TableMetadata.TrackCreate |
        TableMetadata.TrackUpdate)
```

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


## Usage

The package can be a start for other projects that aim to develop an ORM.
Such project is [https://github.com/matei-tm/flutter-sqlite-m8-generator](https://github.com/matei-tm/flutter-sqlite-m8-generator)

```dart
@DataTable("a01_tests", TableMetadata.SoftDeletable)
class A01Test implements DbAccountRelatedEntity {
  @DataColumn("id", ColumnMetadata.PrimaryKey | ColumnMetadata.Unique | ColumnMetadata.AutoIncrement)
  int id;

  @DataColumn("account_id")
  int accountId;

  @DataColumn("record_date")
  int recordDate;
}
```

