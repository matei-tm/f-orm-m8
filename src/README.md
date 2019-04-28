# Flutter ORM Mate - flutter_orm_m8

[![Gitter](https://img.shields.io/gitter/room/flutter-orm-m8/community.svg?style=flat-square)](https://gitter.im/flutter-orm-m8/community) [![GitHub release](https://img.shields.io/github/release/matei-tm/flutter-orm-m8.svg)](https://github.com/matei-tm/flutter-orm-m8) [![pub package](https://img.shields.io/pub/v/flutter_orm_m8.svg)](https://pub.dartlang.org/packages/flutter_orm_m8) [![Build Status](https://travis-ci.org/matei-tm/flutter-orm-m8.svg?branch=master)](https://travis-ci.org/matei-tm/flutter-orm-m8) [![license](https://img.shields.io/github/license/matei-tm/flutter-orm-m8.svg)](https://github.com/matei-tm/flutter-orm-m8/blob/master/LICENSE)

Flutter package for ORM annotations.

- [Flutter ORM Mate - flutter_orm_m8](#flutter-orm-mate---flutterormm8)
  - [Introduction](#introduction)
  - [Annotations](#annotations)
    - [DataTable](#datatable)
    - [DataColumn](#datacolumn)
    - [TableMetadata](#tablemetadata)
    - [ColumnMetadata](#columnmetadata)
  - [Interfaces](#interfaces)
    - [DbOpenEntity](#dbopenentity)
    - [DbEntity](#dbentity)
    - [DbAccountEntity](#dbaccountentity)
    - [DbAccountRelatedEntity implements DbEntity](#dbaccountrelatedentity-implements-dbentity)
  - [Usage](#usage)

## Introduction

The package adds definitions for a set of types that could be combined to expand ORM capabilities in the annotated code.
The current version, defines four annotation types:

- DataTable
- DataColumn
- TableMetadata
- ColumnMetadata

In order to ease the code emitting four abstract classes are defined:

- DbOpenEntity
- DbEntity
- DbAccountEntity implements DbEntity
- DbAccountRelatedEntity implements DbEntity

## Annotations

### DataTable

DataTable describes the required name for the table in conjuction with a bit mask for optional TableMetadata

```dart
@DataTable("a01_tests")
class A01Test implements DbAccountRelatedEntity {
```

### DataColumn

DataColumn describes the required name for the column in conjunction  with a bit mask for required ColumnMetadata's

```dart
  @DataColumn("id", ColumnMetadata.primaryKey | ColumnMetadata.unique | ColumnMetadata.autoIncrement)
  int id;
```

### TableMetadata

The TableMetadata describes the basic options for the table:

- softDeletable
- trackCreate
- trackUpdate

The options may be combined in various ways using | operator

```dart
@DataTable(
    "health_issues",
        TableMetadata.softDeletable |
        TableMetadata.trackCreate |
        TableMetadata.trackUpdate)
```

### ColumnMetadata

The ColumnMetadata describes the basic options for a column definition:

- ignore
- primaryKey
- unique
- notNull
- autoIncrement
- indexed

The options may be combined in various ways using | operator

```dart
@DataColumn("id", ColumnMetadata.primaryKey | ColumnMetadata.unique | ColumnMetadata.autoIncrement)
```

## Interfaces

### DbOpenEntity

DbOpenEntity is as it's name suggest a template for non restrictive models with composite primary keys.
Also it may be used for non integer primary key implementation.  
It defines a single method getPrimaryKey

### DbEntity

May be used for a general purpose model template with integer primary key named `id`

### DbAccountEntity

It implements DbEntity.
May be used for a model template in a generic user account with the following fields:

- userName
- email
- abbreviation
- isCurrent

### DbAccountRelatedEntity implements DbEntity

It implements DbEntity.
May be used for a model template in a generic, account dependent, entity with the following fields:

- accountId

## Usage

The package can be a start for other projects that aim to develop an ORM.
Such project is [https://github.com/matei-tm/flutter-sqlite-m8-generator](https://github.com/matei-tm/flutter-sqlite-m8-generator)

```dart
@DataTable("a01_tests", TableMetadata.softDeletable)
class A01Test implements DbAccountRelatedEntity {
  @DataColumn("id", ColumnMetadata.primaryKey | ColumnMetadata.unique | ColumnMetadata.autoIncrement)
  int id;

  @DataColumn("account_id")
  int accountId;

  @DataColumn("record_date")
  int recordDate;
}
```

