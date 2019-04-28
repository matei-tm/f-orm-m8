# Flutter ORM Mate - flutter_orm_m8

[![Gitter](https://img.shields.io/gitter/room/flutter-orm-m8/community.svg?style=flat-square)](https://gitter.im/flutter-orm-m8/community) [![GitHub release](https://img.shields.io/github/release/matei-tm/flutter-orm-m8.svg)](https://github.com/matei-tm/flutter-orm-m8) [![pub package](https://img.shields.io/pub/v/flutter_orm_m8.svg)](https://pub.dartlang.org/packages/flutter_orm_m8) [![Build Status](https://travis-ci.org/matei-tm/flutter-orm-m8.svg?branch=master)](https://travis-ci.org/matei-tm/flutter-orm-m8) [![license](https://img.shields.io/github/license/matei-tm/flutter-orm-m8.svg)](https://github.com/matei-tm/flutter-orm-m8/blob/master/LICENSE)

Flutter package for ORM annotations.

- [Flutter ORM Mate - flutter_orm_m8](#flutter-orm-mate---flutterormm8)
  - [Introduction](#introduction)
  - [Annotations](#annotations)
    - [DataTable](#datatable)
    - [DataColumn](#datacolumn)
      - [Description](#description)
      - [A simple approach](#a-simple-approach)
      - [A fine tuned approach](#a-fine-tuned-approach)
    - [TableMetadata](#tablemetadata)
    - [ColumnMetadata](#columnmetadata)
    - [CompositeConstraint](#compositeconstraint)
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
- CompositeConstraint

In order to ease the code emitting, four abstract classes are defined:

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

#### Description

The DataColumn constructor has three parameters:
- name
  - type: String
  - positional
  - mandatory
- metadataLevel 
  - type: int as combination of [MetadataLevel](#MetadataLevel)
  - named
  - optional
- compositeConstraints
  - type: List<[CompositeConstraint](#CompositeConstraint)>
  - named
  - optional

```dart
 const DataColumn(this.name, {this.metadataLevel, this.compositeConstraints});
```

#### A simple approach

DataColumn describes the required name for the column in conjunction  with a bit mask for required ColumnMetadata's

```dart
  @DataColumn(
    "id", 
    metadataLevel: ColumnMetadata.primaryKey | ColumnMetadata.unique | ColumnMetadata.autoIncrement)
  int id;
```

#### A fine tuned approach

DataColumn describes the required name for the column in conjunction  with a list of composite constraints. For example, if we need a composite, unique constraint defined on the combination of two fields, we define the composite with the same name:

```dart
  @DataColumn("account_id", compositeConstraints: [
    CompositeConstraint(
        name: "uq_account_entry",
        constraintType: CompositeConstraintType.unique)
  ])
  int accountId;

  @DataColumn("description", compositeConstraints: [
    CompositeConstraint(
        name: "uq_account_entry",
        constraintType: CompositeConstraintType.unique)
  ])
  String description;
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
    metadataLevel: TableMetadata.softDeletable | TableMetadata.trackCreate | TableMetadata.trackUpdate)
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
@DataColumn(
  "id", 
  metadataLevel: ColumnMetadata.primaryKey | ColumnMetadata.unique | ColumnMetadata.autoIncrement)
```

### CompositeConstraint

The CompositeConstraint is instantiated with named, required parameters:

- name - the name of the constraint
- constraintType - the type of the constraint as enum with the following values:
  -  unique, 
  -  primaryKey, 
  -  foreignKey, 
  -  indexed


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
  @DataColumn(
    "id", 
    metadataLevel: ColumnMetadata.primaryKey | ColumnMetadata.unique | ColumnMetadata.autoIncrement)
  int id;

  @DataColumn("account_id", compositeConstraints: [
    CompositeConstraint(
        name: "uq_account_entry",
        constraintType: CompositeConstraintType.unique)
  ])
  int accountId;

  @DataColumn("description", compositeConstraints: [
    CompositeConstraint(
        name: "uq_account_entry",
        constraintType: CompositeConstraintType.unique)
  ])
  String description;

  @DataColumn("record_date")
  int recordDate;
}
```

