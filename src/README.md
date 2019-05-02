# Dart ORM Mate - f_orm_m8

[![Gitter](https://img.shields.io/gitter/room/flutter-orm-m8/community.svg?style=flat-square)](https://gitter.im/flutter-orm-m8/community) [![GitHub release](https://img.shields.io/github/release/matei-tm/f-orm-m8.svg)](https://github.com/matei-tm/f-orm-m8) [![pub package](https://img.shields.io/pub/v/f_orm_m8.svg)](https://pub.dartlang.org/packages/f_orm_m8) [![Build Status](https://travis-ci.org/matei-tm/f-orm-m8.svg?branch=master)](https://travis-ci.org/matei-tm/f-orm-m8) [![license](https://img.shields.io/github/license/matei-tm/f-orm-m8.svg)](https://github.com/matei-tm/f-orm-m8/blob/master/LICENSE)

Dart package for ORM annotations.

- [Dart ORM Mate - f_orm_m8](#flutter-orm-mate---formm8)
  - [Introduction](#introduction)
  - [Annotations](#annotations)
    - [DataTable](#datatable)
      - [TableMetadata](#tablemetadata)
    - [DataColumn](#datacolumn)
      - [ColumnMetadata](#columnmetadata)
      - [CompositeConstraint](#compositeconstraint)
      - [A simple approach](#a-simple-approach)
      - [A fine tuned approach](#a-fine-tuned-approach)
  - [Interfaces](#interfaces)
    - [DbOpenEntity](#dbopenentity)
    - [DbEntity](#dbentity)
    - [DbAccountEntity](#dbaccountentity)
    - [DbAccountRelatedEntity implements DbEntity](#dbaccountrelatedentity-implements-dbentity)
  - [Usage](#usage)

## Introduction

The package adds definitions for a set of types that could be combined to expand ORM capabilities in the annotated code.
The current version defines two main annotation types and some helpers associated with each definition:

- [DataTable](#datatable)
  - [TableMetadata](#tablemetadata)
- [DataColumn](#datacolumn)
  - [ColumnMetadata](#columnmetadata)
  - [CompositeConstraint](#compositeconstraint)

In order to ease the code emitting, four abstract classes are defined:

- [DbOpenEntity](#dbopenentity)
- [DbEntity](#dbentity)
- [DbAccountEntity implements DbEntity](#dbaccountentity)
- [DbAccountRelatedEntity implements DbEntity](#dbaccountrelatedentity-implements-dbentity)

## Annotations

### DataTable

DataTable describes the required name for the table in conjuction with a bit mask for optional [TableMetadata](#TableMetadata). Table metadata is specified with the parameter `metadataLevel`, and is a syntactic sugar to generate the proper fixture without explicitly add the required fields.  

```dart
@DataTable(
  "a01_tests",
  metadataLevel: TableMetadata.softDeletable | TableMetadata.trackCreate | TableMetadata.trackUpdate)
class A01Test implements DbAccountRelatedEntity {
```

#### TableMetadata

The TableMetadata describes the basic options for the table:

- softDeletable
- trackCreate
- trackUpdate

The options may be combined in various ways using | operator

```dart
@DataTable(
    "health_issues",
    metadataLevel: 
      TableMetadata.softDeletable | 
      TableMetadata.trackCreate | 
      TableMetadata.trackUpdate)
```

### DataColumn

The DataColumn describes how the fields will be transformed into entity attributes. 
The DataColumn constructor has three parameters:
- name
  - purpose: to specify the entity name
  - type: String
  - positional
  - mandatory
- metadataLevel 
  - purpose: syntactic sugar to specify common use cases
  - type: int as combination of [ColumnMetadata](#ColumnMetadata)
  - named
  - optional
- compositeConstraints
  - purpose: a fine grain mode to specify composite constraints
  - type: List<[CompositeConstraint](#CompositeConstraint)>
  - named
  - optional

```dart
 const DataColumn(this.name, {this.metadataLevel, this.compositeConstraints});
```

#### ColumnMetadata

Column metadata is specified with the parameter `metadataLevel`. Is a syntactic sugar to generate a quick fixture, offering basic options for the following use cases:

- ignore
- primaryKey
- unique
- notNull
- autoIncrement
- indexed

The options can be combined in various ways using | operator

```dart
@DataColumn(
  "id", 
  metadataLevel: ColumnMetadata.primaryKey | ColumnMetadata.unique | ColumnMetadata.autoIncrement)
```

The `primaryKey`, `unique`, `indexed` constraints can be generated in a targetted way using [CompositeConstraint](CompositeConstraint)

#### CompositeConstraint

The composite constraint is able to specify the name and the type of the constraint. If the same name is used on multiple DataColumns, it will signal a composite constraint that will cover all the involved fields.
The CompositeConstraint is instantiated with named, required parameters:

- name - the name of the constraint
- constraintType - the type of the constraint as enum with the following values:
  -  unique, 
  -  primaryKey, 
  -  foreignKey, 
  -  indexed

#### A simple approach

DataColumn describes the required name for the column in conjunction  with a bit mask for required column metadata.

```dart
  @DataColumn(
    "id", 
    metadataLevel: 
      ColumnMetadata.primaryKey | 
      ColumnMetadata.unique | 
      ColumnMetadata.autoIncrement)
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

## Interfaces

### DbOpenEntity

DbOpenEntity is, as it's name suggests, a template for non restrictive models with composite primary keys.
It can also be used for non integer primary key implementation.  
It defines a single method getPrimaryKey

### DbEntity

Can be used for a general purpose model template with integer primary key named `id`

### DbAccountEntity

It implements DbEntity.
Can be used for a model template in a generic user account with the following fields:

- userName
- email
- abbreviation
- isCurrent

### DbAccountRelatedEntity implements DbEntity

It implements DbEntity.
Can be used for a model template in a generic, account dependent, entity with the following fields:

- accountId

## Usage

The package can be a start for other projects that aim to develop an ORM.
Such a project is [https://github.com/matei-tm/flutter-sqlite-m8-generator](https://github.com/matei-tm/flutter-sqlite-m8-generator)

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

